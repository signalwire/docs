import React from "react";

interface IconProps {
  color?: string;
  size?: number;
}

export const SmsIcon: React.FC<IconProps> = ({ color = "#044EF4", size = 24 }) => (
  <svg width={size} height={size} viewBox="0 0 41 40">
    <path
      d="M36.6875 0H4.6875C2.4875 0 0.6875 1.8 0.6875 4V40L8.6875 32H36.6875C38.8875 32 40.6875 30.2 40.6875 28V4C40.6875 1.8 38.8875 0 36.6875 0ZM36.6875 28H8.6875L4.6875 32V4H36.6875V28ZM10.6875 14H14.6875V18H10.6875V14ZM18.6875 14H22.6875V18H18.6875V14ZM26.6875 14H30.6875V18H26.6875V14Z"
      fill={color}
    />
  </svg>
);
