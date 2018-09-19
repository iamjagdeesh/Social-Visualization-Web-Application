import React, { Component } from 'react';
import './App.css';
import { Container } from 'reactstrap';
import {
  BrowserRouter as Router,
  Switch,
  Route
} from 'react-router-dom';

import MainNav from './mainNav.js';
import Login from './login.js';
import Register from './register.js';
import Home from './home.js';

class App extends Component {

  constructor(props) {
    super(props);
    this.saveLoginData = this.saveLoginData.bind(this);
    this.state = {loginData: null};
  }

  saveLoginData(loginData) {
    console.log("Inside app: saveLoginData()");
    this.setState({loginData: loginData});
  }

  render() {
    return (
      <Router basename="/aw">
        <Container>
          <MainNav />
          <main className="m-4">
            <Switch>
              <Route exact path="/register" render={() => (<Register 
                                                  loginData={this.state.loginData}
                                                  saveLoginData={this.saveLoginData} />)} />
              <Route path="/login" render={() => (<Login 
                                                  loginData={this.state.loginData}
                                                  saveLoginData={this.saveLoginData} />)} />
              <Route exact path="/home" render={() => (<Home 
                                                  loginData={this.state.loginData}
                                                  saveLoginData={this.saveLoginData} />)} />
            </Switch>
          </main>
          <hr />
        </Container>
      </Router>
    );
  }
}

export default App;