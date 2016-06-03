import React from "react";
import ReactDOM from "react-dom";
import rcl from "PROJECT-NAME";

// sample page content
class App extends React.Component {

  constructor(props) {
    super(props);
  }

  render() {
    return (
      <div>
        <rcl.CHANGE-HERE/>
      </div>
    );
  }
}

ReactDOM.render(
  <App/>,
  document.getElementById('app')
);
