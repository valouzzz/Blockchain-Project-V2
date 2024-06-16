import React, { useEffect, useState } from "react";
import { requestAccounts } from "./utils/contractServices";

function App() {
  useEffect(async () => {
    const out = await requestAccounts();
    console.log("✌️out --->", out);
  }, []);

  return <>Hello</>;
}

export default App;
