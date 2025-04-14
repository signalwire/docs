import React from "react";
import token from "./token";
import C2CWidget from "./C2CWidget";
import styles from "./demo.module.css";
import { FaRobot } from "react-icons/fa";

export default function Home(): JSX.Element {
  return (
    <div className={styles.container}>
      <div className={styles.content}>
        <div className={styles.imageContainer}>
          <img
            src={require("./sigmond-gif.gif").default}
            alt="Sigmond"
            className={styles.sigmondGif}
          />
        </div>
        <h1 className={styles.title}>Hi, I'm Sigmond!</h1>
        <div>I'll answer questions about SignalWire and help you get started.</div>
        <C2CWidget
          destination="/private/demo-1"
          supportsVideo={true}
          supportsAudio={true}
          token={token}
        >
          Click here to chat with me!
        </C2CWidget>
      </div>
    </div>
  );
}
