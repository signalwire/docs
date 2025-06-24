import React, { ReactNode } from 'react';
import clsx from 'clsx';
import styles from './styles.module.css';
import { FaGithub, FaBook } from 'react-icons/fa';
import { SiPypi } from 'react-icons/si';
import { AlphaBadge, BetaBadge } from '../AlphaBetaBadges';
import CodeBlock from '@theme/CodeBlock';
import Link from '@docusaurus/Link';

interface InstallHeroProps {
  title: string;
  installCommand: string;
  language?: string;
  githubUrl?: string;
  docsUrl?: string;
  status?: 'stable' | 'beta' | 'alpha';
  pypiPackage?: string;
  className?: string;
  children?: ReactNode;
}

export default function InstallHero({
  title,
  installCommand,
  language = 'bash',
  githubUrl,
  docsUrl,
  status = 'stable',
  pypiPackage,
  className,
  children,
}: InstallHeroProps): JSX.Element {
  const renderStatusBadge = () => {
    if (status === 'alpha') return <AlphaBadge />;
    if (status === 'beta') return <BetaBadge />;
    return null;
  };

  const getCodeBlockWidth = () => {
    const commandLength = installCommand.length;
    if (commandLength < 30) return '400px';
    if (commandLength < 50) return '500px';
    if (commandLength < 80) return '600px';
    return '100%';
  };

  const getGitHubRepo = (url: string) => {
    return url.replace('https://github.com/', '');
  };

  return (
    <div className={clsx(styles.installHero, className)}>
      <div className={styles.content}>
        <div className={styles.header}>
          <h1 className={styles.title}>{title}</h1>
          {status !== 'stable' && renderStatusBadge()}
        </div>
        
        {children && (
          <div className={styles.description}>
            {children}
          </div>
        )}

        <div className={styles.installSection}>
          <div className={styles.codeBlockWrapper} style={{ maxWidth: getCodeBlockWidth() }}>
            <CodeBlock language={language} showLineNumbers={false}>
              {installCommand}
            </CodeBlock>
          </div>
        </div>

        <div className={styles.links}>
          {githubUrl && (
            <a href={githubUrl} className={styles.link} target="_blank" rel="noopener noreferrer">
              <FaGithub /> GitHub
              <img 
                src={`https://img.shields.io/github/stars/${getGitHubRepo(githubUrl)}?style=social`}
                alt="GitHub stars"
                className={styles.linkShield}
              />
            </a>
          )}
          {pypiPackage && (
            <a href={`https://pypi.org/project/${pypiPackage}/`} className={styles.link} target="_blank" rel="noopener noreferrer">
              <SiPypi /> PyPI
              <img 
                src={`https://img.shields.io/pypi/v/${pypiPackage}?style=flat-square&color=blue`}
                alt="PyPI version"
                className={styles.linkShield}
              />
            </a>
          )}
          {docsUrl && (
            <Link to={docsUrl} className={styles.link}>
              <FaBook /> SDK Reference
            </Link>
          )}
        </div>
      </div>
    </div>
  );
} 