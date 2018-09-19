import React, { Component } from 'react';
import { Row, Button, Table } from 'reactstrap';
import Cookies from "universal-cookie";

import Login from './login.js';
import LoginHistory from './models/loginHistory.js';
import Stack from './stack.js';
import Visualization from './visualization.js';


class Home extends Component {

    constructor(props) {
        super(props);
        this.saveLoginData = this.saveLoginData.bind(this);
        this.state = {loginData: null, isHistoryTableLoading: true, loginHistoryData: [], stack: false};
        this.logout = this.logout.bind(this);
        this.loginHistory = new LoginHistory();
        this.getLoginHistory = this.getLoginHistory.bind(this);
        this.stack = this.stack.bind(this);
        this.visualization = this.visualization.bind(this);
        console.log("Inside Home!");
    }

    saveLoginData(loginData) {
        this.setState({loginData: loginData});
        this.props.saveLoginData(loginData);
    }

    logout() {
        console.log("Logout button clicked");
        const cookies = new Cookies();
        cookies.remove("userId", {path:'http://localhost:3000/'});
        cookies.remove("userId", {path:'http://localhost:3000/aw'});
        this.saveLoginData(null);
    }

    async getLoginHistory(e) {
        e.preventDefault();
        let loginHistoryData;
        if(this.state.isHistoryTableLoading) {
            loginHistoryData = await this.loginHistory.getLoginHistory(this.props.loginData.userId);
            this.setState({loginHistoryData: loginHistoryData, isHistoryTableLoading: false});
            console.log(loginHistoryData);
        }
        return
    }

    async stack(e) {
        e.preventDefault();
        this.setState({stack: true});
    }

    async visualization(e) {
        e.preventDefault();
        this.setState({visualization: true});
    }

    render() {
        console.log("Inside Home render!");
        return (
            <div>
                {
                    this.props.loginData && !this.state.stack && !this.state.visualization &&
                    <div>
                        <h1>Welcome {this.props.loginData.userName}</h1>
                        <Button onClick={this.getLoginHistory} >Show Login History</Button>
                        <Button onClick={this.stack} >Go to Stack Overflow</Button>
                        <Button onClick={this.visualization} >Visualization</Button>
                        <Row />
                        {
                            !this.state.isHistoryTableLoading &&
                            <Table striped bordered hover responsive>
                                <thead>
                                    <tr>
                                    <th>#</th>
                                    <th>Login Time</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {   
                                        this.state.loginHistoryData.map((history, index) => {
                                        return <tr key={index+1}>
                                            <td>{index+1}</td>
                                            <td>{history.loginTime}</td>
                                        </tr>
                                        })
                                    }
                                </tbody>
                            </Table>
                        }
                        <Button onClick={this.logout}>Logout</Button>
                    </div>
                }
                {
                    !this.props.loginData &&
                    <Login 
                        loginData={this.state.loginData}
                        saveLoginData={this.saveLoginData}/>
                }
                {
                    this.state.stack &&
                    <Stack 
                        loginData={this.props.loginData}
                        saveLoginData={this.saveLoginData}/>
                }
                {
                    this.state.visualization &&
                    <Visualization 
                        loginData={this.props.loginData}
                        saveLoginData={this.saveLoginData}/>
                }
            </div>
        );
    }
  
}

export default Home;