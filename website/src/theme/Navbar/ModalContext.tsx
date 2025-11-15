import React, { createContext, useContext } from 'react';

// Context for modal state
export interface ModalContextType {
  isModalOpen: boolean;
  setModalOpen: React.Dispatch<React.SetStateAction<boolean>>;
  currentProduct: string;
  setCurrentProduct: React.Dispatch<React.SetStateAction<string>>;
}

export const ModalContext = createContext<ModalContextType | null>(null);

export function useModalContext(): ModalContextType {
  const context = useContext(ModalContext);
  if (!context) {
    throw new Error('useModalContext must be used within ModalContext.Provider');
  }
  return context;
}
