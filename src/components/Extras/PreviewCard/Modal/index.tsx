import React, { ReactNode, useEffect, isValidElement, useRef } from 'react';
import { createPortal } from 'react-dom';
import Mermaid from '@theme/Mermaid';
import styles from './styles.module.css';

export interface ModalProps {
  isOpen: boolean;
  onClose: () => void;
  children: ReactNode;
}

const Modal: React.FC<ModalProps> = ({ isOpen, onClose, children }) => {
  const overlayRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    if (isOpen) {
      document.body.style.overflow = 'hidden';
      
      const handleEscape = (e: KeyboardEvent) => {
        if (e.key === 'Escape') {
          onClose();
        }
      };
      document.addEventListener('keydown', handleEscape);
      
      return () => {
        document.body.style.overflow = 'unset';
        document.removeEventListener('keydown', handleEscape);
      };
    }
  }, [isOpen, onClose]);

  // Don't render anything if modal is not open and animation has finished
  const overlayElement = overlayRef.current;
  if (!isOpen && overlayElement?.style.opacity === '0') return null;

  // Check if the content is a Mermaid diagram
  const isMermaid = isValidElement(children) && children.type === Mermaid;

  const modalContent = (
    <div 
      ref={overlayRef}
      className={styles.modalOverlay} 
      onClick={onClose}
      aria-hidden={!isOpen}
      role="dialog"
      aria-modal="true"
    >
      <div 
        className={styles.modalContent}
        onClick={e => e.stopPropagation()}
      >
        <button 
          className={styles.modalClose} 
          onClick={onClose}
          aria-label="Close modal"
        >
          ×
        </button>
        <div className={styles.modalContentWrapper}>
          {isMermaid ? (
            <div className={styles.mermaidContent}>
              {children}
            </div>
          ) : children}
        </div>
      </div>
    </div>
  );

  return createPortal(modalContent, document.body);
};

export default React.memo(Modal); 