import React, { Component } from 'react';
import { Button } from 'reactstrap';

import Login from './login.js';

class Home extends Component {

    constructor(props) {
        super(props);
        this.saveLoginData = this.saveLoginData.bind(this);
        this.state = {loginData: null};
        this.logout = this.logout.bind(this);
        console.log("Inside Home!");
    }

    saveLoginData(loginData) {
        this.setState({loginData: loginData});
        this.props.saveLoginData(loginData);
    }

    logout() {
        console.log("Logout button clicked");
        this.saveLoginData(null);
    }

    render() {
        console.log("Inside Home render!");
        return (
            <div>
                {
                    this.props.loginData &&
                    <div>
                        <h1>Welcome {this.props.loginData.userName}</h1>
                        <Button onClick={this.logout}>Logout</Button>
                    </div>
                }
                {
                    !this.props.loginData &&
                    <Login 
                        loginData={this.state.loginData}
                        saveLoginData={this.saveLoginData}/>
                }
            </div>
        );
    }
  
}

export default Home;