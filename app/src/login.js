import React, { Component } from 'react';
import './App.css';
import { Row, Col, Form, FormGroup, Label, Input, FormText, Button } from 'reactstrap';

import UserProfile from './models/user.js';
import Home from './home.js';
import Cookies from "universal-cookie";

class Login extends Component {

    constructor(props) {
        super(props);
        this.state = { loginData: null, loading: false, progress: 0};
        this.login = this.login.bind(this);
        this.saveLoginData = this.saveLoginData.bind(this);
        this.loginUser = new UserProfile();
    }

    saveLoginData(loginData) {
        this.setState({loginData: loginData});
        this.props.saveLoginData(loginData);
    }

    async login(e) {

        e.preventDefault();
        let userId = e.target.userId.value;
        let password = e.target.password.value;

        if (!userId || !password) {
            this.setState({ login_err: new Error("did you forget to enter a username or password? 😏"), loading: false });
            return
        }

        this.setState({ loginData: null, progress: 0, loading: true, login_err: null });
        let data;
        try {
            data = await this.loginUser.login(userId, password);
            this.saveLoginData(data);
            const cookies = new Cookies();
            cookies.set("userId", userId, {path:'http://localhost:3000/'});
        } catch (err) {
            const respData = err.response && err.response.data && err.response.data.error;
            if (respData) {
                data = err.response.data;
            }

            this.setState((prev) => ({ ...prev, login_err: err }));
        }
        finally {
            this.setState((prev) => ({ ...prev, loading: false }));
        }

        if (data) {
            this.setState((prev) => ({ ...prev, loginData: data }));
        }
    }

    render() {
        return (
        <div>
            {!this.props.loginData &&
            <Form onSubmit={this.login} method="post" action="/aw/home/" encType="application/json">
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
            }
            {this.props.loginData &&
            <Row className="mt-3">
                <Col>
                <Home loginData={this.props.loginData} saveLoginData={this.saveLoginData}/>
                </Col>
            </Row>
            }
        </div>
        );
    }
}

export default Login;