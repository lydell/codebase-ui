import "./init";
import detectOs from "./detectOs";
import preventDefaultGlobalKeyboardEvents from "./preventDefaultGlobalKeyboardEvents";

const basePath = new URL(document.baseURI).pathname;
const apiBasePath = ["api"];

const flags = {
  operatingSystem: detectOs(window.navigator),
  basePath,
  apiBasePath,
  appContext: "UnisonShare",
};

preventDefaultGlobalKeyboardEvents();

// The main entry point for the `UnisonShare` target of the Codebase UI.
window.Elm.UnisonShare.init({ flags });
