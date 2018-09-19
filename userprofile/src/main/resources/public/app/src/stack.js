import React, { Component } from 'react';
import { Row, Col, Button, Table } from 'reactstrap';

class Stack extends Component {

    constructor(props) {
        super(props);
        this.saveLoginData = this.saveLoginData.bind(this);
        this.state = {loginData: null};
        this.logout = this.logout.bind(this);
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
        return(
            <div>
                {
                    this.props.loginData &&
                    
                    <div>
                        <h1>Stack Overflow Java</h1>
                        <a href="https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15" target="_blank">stackoverflow</a>
                        <Button onClick={this.logout}>Logout</Button>
                    </div>
                }
            </div>
        );
    }
}

export default Stack;