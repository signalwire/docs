import React from "react";

interface IconProps {
  color?: string;
  size?: number;
}

export const VoiceIcon: React.FC<IconProps> = ({ color = "#044EF4", size = 24 }) => (
  <svg width={size} height={size} viewBox="0 0 37 40">
    <path
      d="M8.3125 32H12.3125V8H8.3125V32ZM16.3125 40H20.3125V0H16.3125V40ZM0.3125 24H4.3125V16H0.3125V24ZM24.3125 32H28.3125V8H24.3125V32ZM32.3125 16V24H36.3125V16H32.3125Z"
      fill={color}
    />
  </svg>
);
