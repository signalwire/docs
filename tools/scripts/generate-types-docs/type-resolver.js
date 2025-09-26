const { config } = require('./config')

class TypeResolver {
  constructor(types) {
    this.typeMap = new Map()
    this.typesByOriginalName = new Map()
    this.stats = {
      totalTypes: types.length,
      resolvedReferences: 0,
      unresolvedReferences: 0,
    }

    types.forEach((type) => {
      this.typeMap.set(type.name, type)

      if (!this.typesByOriginalName.has(type.originalName)) {
        this.typesByOriginalName.set(type.originalName, [])
      }
      this.typesByOriginalName.get(type.originalName).push(type)
    })
  }

  resolveAllTypes() {
    const resolvedTypes = []

    for (const type of this.typeMap.values()) {
      const resolvedType = this.resolveType(type)

      if (this.shouldIncludeType(resolvedType)) {
        resolvedTypes.push(resolvedType)
      }
    }

    return resolvedTypes.sort((a, b) => a.name.localeCompare(b.name))
  }

  resolveType(type) {
    const resolved = { ...type }

    if (type.kind === 'type-alias' && type.type) {
      resolved.resolvedType = this.resolveTypeReference(type.type)

      if (this.isEmptyTypeAlias(resolved)) {
        const mainType = this.findMainType(type)
        if (mainType) {
          resolved.isAliasOf = mainType.name
          resolved.mainTypeDescription = this.formatComment(mainType.comment)
        }
      }
    }

    if (type.children) {
      resolved.children = type.children.map((child) => ({
        ...child,
        resolvedType: child.type ? this.resolveTypeReference(child.type) : null,
      }))
    }

    return resolved
  }

  resolveTypeReference(type, isInTable = false) {
    if (!type) return 'unknown'

    switch (type.type) {
      case 'literal':
        return `${type.value}`

      case 'union':
        if (isInTable) {
          // For tables, use a more readable format without pipes
          const types = type.types.map((t) =>
            this.resolveTypeReference(t, isInTable)
          )
          return types.join(' or ')
        } else {
          return type.types
            .map((t) => this.resolveTypeReference(t, isInTable))
            .join(' | ')
        }

      case 'array':
        return `${this.resolveTypeReference(type.elementType, isInTable)}[]`

      case 'reference':
        let typeName = type.name || 'unknown'

        // Handle generic types with type arguments
        if (type.typeArguments && type.typeArguments.length > 0) {
          const typeArgs = type.typeArguments
            .map((arg) => this.resolveTypeReference(arg, isInTable))
            .join(', ')
          typeName = `${typeName}<${typeArgs}>`
        }

        const refType = this.findTypeByReference(type.name)
        if (refType) {
          this.stats.resolvedReferences++

          if (isInTable) {
            // For tables, don't create links to avoid backtick conflicts
            return type.typeArguments && type.typeArguments.length > 0
              ? `${typeName}<${type.typeArguments
                  .map((arg) => this.resolveTypeReference(arg, isInTable))
                  .join(', ')}>`
              : typeName
          } else {
            // For non-table contexts, create links
            const anchor = this.createAnchor(refType.name)
            const linkedName = `[${type.name}](#${anchor})`
            return type.typeArguments && type.typeArguments.length > 0
              ? `${linkedName}<${type.typeArguments
                  .map((arg) => this.resolveTypeReference(arg, isInTable))
                  .join(', ')}>`
              : linkedName
          }
        } else {
          this.stats.unresolvedReferences++
          return typeName
        }

      case 'intrinsic':
        return type.name

      case 'reflection':
        if (type.declaration && type.declaration.children) {
          const props = type.declaration.children
            .map((child) => {
              const optional = child.flags?.isOptional ? '?' : ''
              return `${child.name}${optional}: ${this.resolveTypeReference(
                child.type,
                true
              )}`
            })
            .join(isInTable ? '; ' : ', ')

          return isInTable
            ? `{ ${props} }`
            : `{\n  ${props.split(', ').join(',\n  ')}\n}`
        } else if (type.declaration && type.declaration.signatures) {
          // Handle function signatures
          const signatures = type.declaration.signatures
            .map((sig) => {
              const params = sig.parameters
                ? sig.parameters
                    .map(
                      (p) =>
                        `${p.name}: ${this.resolveTypeReference(p.type, true)}`
                    )
                    .join(', ')
                : ''
              const returnType = sig.type
                ? this.resolveTypeReference(sig.type, true)
                : 'void'
              return `(${params}) => ${returnType}`
            })
            .join(' | ')
          return signatures
        }
        return 'object'

      default:
        return type.name || 'unknown'
    }
  }

  findTypeByReference(referenceName) {
    const exactMatch = this.typeMap.get(referenceName)
    if (exactMatch) return exactMatch

    const byOriginalName = this.typesByOriginalName.get(referenceName)
    if (byOriginalName && byOriginalName.length > 0) {
      return byOriginalName[0]
    }

    for (const [fullName, type] of this.typeMap.entries()) {
      if (fullName.endsWith(`.${referenceName}`)) {
        return type
      }
    }

    for (const [fullName, type] of this.typeMap.entries()) {
      if (fullName.includes(referenceName)) {
        return type
      }
    }

    return null
  }

  findMainType(aliasType) {
    const baseName = aliasType.originalName
    const possibleMainTypes = this.typesByOriginalName.get(baseName) || []

    return possibleMainTypes.find(
      (type) =>
        type.kind !== 'type-alias' &&
        type.name !== aliasType.name &&
        this.formatComment(type.comment)
    )
  }

  isEmptyTypeAlias(type) {
    if (type.kind !== 'type-alias') return false

    const resolvedTypeStr = this.resolveTypeReference(type.type)
    return (
      !resolvedTypeStr ||
      resolvedTypeStr === 'unknown' ||
      config.EXCLUDED_TYPES.includes(resolvedTypeStr) ||
      !this.formatComment(type.comment) ||
      this.formatComment(type.comment).length < config.MIN_DESCRIPTION_LENGTH
    )
  }

  shouldIncludeType(type) {
    if (
      type.kind === 'type-alias' &&
      this.isEmptyTypeAlias(type) &&
      !type.isAliasOf
    ) {
      return false
    }
    return true
  }

  createAnchor(typeName) {
    return typeName
      .toLowerCase()
      .replace(/[^a-z0-9.-]/g, '-')
      .replace(/-+/g, '-')
      .replace(/^-|-$/g, '')
  }

  formatComment(comment) {
    if (!comment) return ''

    let text = ''
    if (comment.summary) {
      text += comment.summary.map((part) => part.text || '').join('')
    }

    return text.trim()
  }

  getStats() {
    return { ...this.stats }
  }

  getTypeByName(name) {
    return this.typeMap.get(name)
  }
}

module.exports = { TypeResolver }
