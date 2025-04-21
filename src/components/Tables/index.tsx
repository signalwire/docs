import React, { ReactNode } from 'react';
import clsx from 'clsx';
import styles from './styles.module.css';

/**
 * Table usage note:
 * - All children must be DOM elements (not React components).
 * - If using MDX partials, call them as functions (e.g. {Partial()}) so their output is traversable.
 * - Do NOT use <Partial /> as a child; this will not work for row extraction.
 */
export interface TablesProps {
  /**
   * The table content elements (can be multiple tables, MDX content, or imported partials)
   */
  children: ReactNode;
  /**
   * Optional class name to apply to table
   */
  className?: string;
  /**
   * Optional caption for the table
   */
  caption?: string;
  /**
   * Placeholder value for padded cells when a row has fewer columns than the header
   */
  padPlaceholder?: ReactNode;
  /**
   * If true, logs debug info about header/row extraction
   */
  debug?: boolean;
}

interface TablePartsResult {
  thead: React.ReactElement | null;
  rows: React.ReactElement[];
}

/**
 * Recursively extract the first <thead> and all <tr> rows from any depth of children.
 * Only the first <thead> is used as the header; all <tr> outside that thead are body rows.
 * This works if children are DOM elements or fragments (not React components).
 */
function extractTableParts(
  node: ReactNode,
  foundThead: React.ReactElement | null = null,
  skipThead: boolean = false
): TablePartsResult {
  let thead: React.ReactElement | null = foundThead;
  let rows: React.ReactElement[] = [];
  if (!node) return { thead, rows };

  if (Array.isArray(node)) {
    node.forEach(child => {
      const result = extractTableParts(child, thead, skipThead);
      if (!thead && result.thead) thead = result.thead;
      rows = rows.concat(result.rows);
    });
  } else if (React.isValidElement(node)) {
    if (node.type === 'thead') {
      if (!thead) {
        thead = node;
        // Only skip thead after the first one
        React.Children.forEach(node.props.children, (child: ReactNode) => {
          // Don't traverse into thead children for the first thead
        });
        return { thead, rows };
      } else {
        // For subsequent theads, skip all their children
        return { thead, rows };
      }
    }
    if (node.type === 'tr' && !skipThead) {
      rows.push(node);
    } else if (node.type === 'tbody' || node.type === React.Fragment) {
      React.Children.forEach(node.props.children, (child: ReactNode) => {
        const result = extractTableParts(child, thead, skipThead);
        if (!thead && result.thead) thead = result.thead;
        rows = rows.concat(result.rows);
      });
    } else if (node.props && node.props.children) {
      const result = extractTableParts(node.props.children, thead, skipThead);
      if (!thead && result.thead) thead = result.thead;
      rows = rows.concat(result.rows);
    }
  }
  return { thead, rows };
}

function getHeaderColumnCount(thead: React.ReactElement | null): number {
  if (!thead) return 0;
  const headerRows = React.Children.toArray(thead.props.children);
  if (headerRows.length === 0) return 0;
  const firstRow = headerRows[0] as React.ReactElement;
  if (!firstRow || !firstRow.props || !firstRow.props.children) return 0;
  return React.Children.count(firstRow.props.children);
}

function normalizeRowCells(row: React.ReactElement, colCount: number, rowIdx: number, padPlaceholder: ReactNode): React.ReactElement {
  const cells = React.Children.toArray(row.props.children);
  let normalizedCells = cells;
  if (cells.length < colCount) {
    // Pad with placeholder cells
    normalizedCells = [
      ...cells,
      ...Array.from({ length: colCount - cells.length }, (_, i) => <td key={`pad-${rowIdx}-${i}`}>{padPlaceholder}</td>)
    ];
  } else if (cells.length > colCount) {
    // Truncate extra cells
    normalizedCells = cells.slice(0, colCount);
  }
  return React.cloneElement(row, { key: `row-${rowIdx}` }, normalizedCells);
}

export const Tables: React.FC<TablesProps> = ({
  children,
  className,
  caption,
  padPlaceholder = '-',
  debug = false,
}: TablesProps) => {
  // Extract the first thead and all body rows from any depth of children
  const { thead, rows: allBodyRows } = extractTableParts(children);

  if (debug) {
    // eslint-disable-next-line no-console
    console.log('[Table debug] thead:', thead);
    // eslint-disable-next-line no-console
    console.log('[Table debug] rows:', allBodyRows);
  }

  if (!thead || allBodyRows.length === 0) {
    return;
  }

  const colCount = getHeaderColumnCount(thead);
  return (
    <div className={styles.tableWrapper}>
      <table className={className}>
        {caption && <caption>{caption}</caption>}
        {thead}
        <tbody>
          {allBodyRows.map((row: React.ReactElement, idx: number) => normalizeRowCells(row, colCount, idx, padPlaceholder))}
        </tbody>
      </table>
    </div>
  );
};

export default Tables;
