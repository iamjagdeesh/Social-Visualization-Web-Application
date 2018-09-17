import React, { Component } from 'react';
import './App.css';
import { Row, Col, Form, FormGroup, Label, Input, FormText, Button } from 'reactstrap';

import UserProfile from './models/user.js';
import Home from './home.js';

class Register extends Component {

    constructor(props) {
        super(props);
        this.state = { loginData: null, loading: false, progress: 0};
        this.register = this.register.bind(this);
        this.saveLoginData = this.saveLoginData.bind(this);
        this.registerUser = new UserProfile();
    }

    saveLoginData(loginData) {
        this.setState({loginData: loginData});
        this.props.saveLoginData(loginData);
    }

    async register(e) {

        e.preventDefault();
        let userId = e.target.userId.value;
        let userName = e.target.userName.value;
        let password = e.target.password.value;

        if (!userId || !password || !userName) {
            this.setState({ register_err: new Error("did you forget to enter a username or password or userId? 😏"), loading: false });
            return
        }

        this.setState({ loginData: null, progress: 0, loading: true, register_err: null });
        let data;
        try {
            data = await this.registerUser.register(userId, userName, password);
            this.saveLoginData(data);
        } catch (err) {
            const respData = err.response && err.response.data && err.response.data.error;
            if (respData) {
                data = err.response.data;
                //console.log(data);
            }

            console.error(`error while register: ${err.message}`);
            this.setState((prev) => ({ ...prev, register_err: err }));
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
            <Form onSubmit={this.register} method="post" action="/aw/home/" encType="application/json">
                <FormGroup>
                    <Label for="userId">User ID</Label>
                    <Input type="text" name="userId" id="userId" />
                    <FormText color="muted">
                        Enter userId
                    </FormText>
                </FormGroup>
                <FormGroup>
                    <Label for="userName">User Name</Label>
                    <Input type="text" name="userName" id="userName" />
                    <FormText color="muted">
                        Enter userName
                    </FormText>
                </FormGroup>
                <FormGroup>
                <Label for="password">Password</Label>
                <Input type="password" name="password" id="password" />
                <FormText color="muted">
                    Enter password
                </FormText>
                </FormGroup>
                <Button disabled={this.state.loading} type="submit" color="primary">Register</Button>
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

export default Register;