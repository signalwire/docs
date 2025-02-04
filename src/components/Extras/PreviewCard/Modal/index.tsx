import React, { ReactNode, useEffect, isValidElement, useRef } from 'react';
import { createPortal } from 'react-dom';
import Mermaid from '@theme/Mermaid';
import BrowserOnly from '@docusaurus/BrowserOnly';
import styles from './styles.module.css';

export interface ModalProps {
  isOpen: boolean;
  onClose: () => void;
  children: ReactNode;
}

const ModalContent: React.FC<ModalProps> = ({ isOpen, onClose, children }) => {
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

  const modalContent = (
    <div 
      ref={overlayRef}
      className={styles.modalOverlay} 
      onClick={onClose}
      aria-hidden={!isOpen}
      role="dialog"
      aria-modal="true"
      style={{ cursor: 'zoom-out' }}
    >
      <div 
        className={styles.modalContent}
        onClick={e => e.stopPropagation()}
      >
        <div 
          className={styles.modalContentWrapper}
          onClick={onClose}
          role="button"
          tabIndex={0}
          aria-label="Click to close expanded view"
          title="Click to close expanded view"
        >
          {children}
        </div>
      </div>
    </div>
  );

  return createPortal(modalContent, document.body);
};

const Modal: React.FC<ModalProps> = React.memo((props) => {
  return (
    <BrowserOnly>
      {() => <ModalContent {...props} />}
    </BrowserOnly>
  );
});

Modal.displayName = 'PreviewCardModal';

export default Modal; 