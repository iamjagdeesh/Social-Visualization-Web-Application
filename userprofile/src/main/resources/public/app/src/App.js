import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import { Alert, Navbar, Nav, Row, Col, NavbarToggler, NavbarBrand, NavItem, Progress, Collapse, Container, Form, FormGroup, Label, Input, FormText, Button } from 'reactstrap';
import {
  BrowserRouter as Router,
  Switch,
  Route,
  NavLink
} from 'react-router-dom';

import UserProfile from './models/user.js';

class App extends Component {
  render() {
    return (
      <Router basename="/aw">
        <Container>
          <main className="m-4">
            <Switch>
              <Route path="/" render={() => (<Login />)} />
            </Switch>
          </main>
          <hr />
        </Container>
      </Router>
    );
  }
}

class Login extends Component {

  constructor() {
    super();
    this.state = { data: null, loading: false, progress: 0 };
    this.login = this.login.bind(this);
    this.loginUser = new UserProfile();
  }

  async login(e) {

    e.preventDefault();
    let userId = e.target.userId.value;
    let password = e.target.password.value;

    if (!userId || !password) {
      this.setState({ login_err: new Error("did you forget to enter a username or password? 😏"), loading: false });
      return
    }

    this.setState({ data: null, progress: 0, loading: true, login_err: null });
    let data;
    try {
      data = await this.loginUser.login(userId, password);
    } catch (err) {
      const respData = err.response && err.response.data && err.response.data.error;
      if (respData) {
        data = err.response.data;
        console.log(data);
      }

      console.error(`error while login: ${err.message}`);
      this.setState((prev) => ({ ...prev, login_err: err }));
    }
    finally {
      this.setState((prev) => ({ ...prev, loading: false }));
    }

    if (data) {
      this.setState((prev) => ({ ...prev, data: data }));
    }
  }

  render() {
    return (
      <div>
        <Form onSubmit={this.login} method="put" action="/aw/login/" encType="application/json">
          <FormGroup>
            <Label for="userId">User ID</Label>
            <Input type="text" name="userId" id="userId" />
            <FormText color="muted">
              Enter userId
            </FormText>
          </FormGroup>
          <FormGroup>
            <Label for="password">Password</Label>
            <Input type="password" name="password" id="password" />
            <FormText color="muted">
              Enter password
            </FormText>
          </FormGroup>
          <Button disabled={this.state.loading} type="submit" color="primary">Login</Button>
        </Form>
      </div>
    );
  }
}

export default App;
