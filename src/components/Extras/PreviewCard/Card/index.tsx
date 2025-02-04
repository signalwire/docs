import React, { ReactNode, useState, isValidElement, useMemo, useCallback } from 'react';
import clsx from 'clsx';
import styles from './styles.module.css';
import Modal from '../Modal';

export interface PreviewCardProps {
  title?: string;
  description?: string;
  children: ReactNode;
  className?: string;
  thumbnail?: ReactNode;
}

const CardMetadata = React.memo<{ title?: string; description?: string }>(({ title, description }) => {
  if (!title && !description) return null;
  
  return (
    <div className={styles.cardMetadata}>
      {title && <h3 className={styles.previewCardTitle}>{title}</h3>}
      {description && <p className={styles.previewCardDescription}>{description}</p>}
    </div>
  );
});

CardMetadata.displayName = 'CardMetadata';

const PreviewCard: React.FC<PreviewCardProps> = React.memo(({
  title,
  description,
  children,
  className,
  thumbnail,
}) => {
  const [isModalOpen, setIsModalOpen] = useState(false);

  const handleOpen = useCallback(() => {
    setIsModalOpen(true);
  }, []);

  const handleClose = useCallback(() => {
    setIsModalOpen(false);
  }, []);

  const handleKeyDown = useCallback((e: React.KeyboardEvent) => {
    if (e.key === 'Enter' || e.key === ' ') {
      e.preventDefault();
      setIsModalOpen(true);
    }
  }, []);

  // Memoize the rendered content
  const renderedContent = useMemo(() => {
    const renderComponent = (component: ReactNode, key: string) => {
      if (isValidElement(component)) {
        const ComponentType = component.type;
        const { key: _, ...componentProps } = component.props;
        
        return (
          <ComponentType 
            key={key}
            {...componentProps} 
          />
        );
      }
      return component;
    };

    const previewContent = thumbnail ? renderComponent(thumbnail, 'preview-thumbnail') : renderComponent(children, 'preview-instance');
    const modalContent = renderComponent(children, 'modal-instance');

    return {
      preview: (
        <div className={styles.previewCardContent}>
          {previewContent}
        </div>
      ),
      modal: modalContent
    };
  }, [children, thumbnail]);

  const cardTitle = title || 'Preview content';
  const ariaLabel = `${cardTitle}. Click to open an expanded view of the content.`;

  return (
    <>
      <div 
        className={clsx(styles.previewCard, className)}
        onClick={handleOpen}
        role="button"
        tabIndex={0}
        onKeyDown={handleKeyDown}
        aria-label={ariaLabel}
        title="Click to open an expanded view of the content"
      >
        <div className={styles.previewCardItemContent}>
          {renderedContent.preview}
          <CardMetadata title={title} description={description} />
        </div>
      </div>

      <Modal
        isOpen={isModalOpen}
        onClose={handleClose}
      >
        {renderedContent.modal}
      </Modal>
    </>
  );
});

PreviewCard.displayName = 'PreviewCard';

export default PreviewCard; 