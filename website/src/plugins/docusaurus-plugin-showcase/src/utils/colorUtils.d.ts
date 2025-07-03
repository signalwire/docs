/**
 * Copyright (c) Facebook, Inc. and its affiliates.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */
/**
 * Stored in session storage
 */
export type ColorState = {
    baseColor: string;
    background: string;
    shades: Shades;
};
export type Shades = {
    [cssVar: string]: {
        adjustment: number;
        adjustmentInput: string;
        displayOrder: number;
        codeOrder: number;
    };
};
export declare const COLOR_SHADES: Shades;
export declare const LIGHT_PRIMARY_COLOR = "#2e8555";
export declare const DARK_PRIMARY_COLOR = "#25c2a0";
export declare const LIGHT_BACKGROUND_COLOR = "#ffffff";
export declare const DARK_BACKGROUND_COLOR = "#181920";
export declare const lightStorage: import("@docusaurus/theme-common/lib/utils/storageUtils").StorageSlot;
export declare const darkStorage: import("@docusaurus/theme-common/lib/utils/storageUtils").StorageSlot;
export declare function getAdjustedColors(shades: Shades, baseColor: string): (Shades[string] & {
    variableName: string;
    hex: string;
})[];
export declare function updateDOMColors({ shades, baseColor, background }: ColorState, isDarkTheme: boolean): void;
