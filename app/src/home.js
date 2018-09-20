import React, { Component } from 'react';
import { Row, Button, Table, Col, Container, Collapse, Jumbotron } from 'reactstrap';
import Cookies from "universal-cookie";

import Login from './login.js';
import LoginHistory from './models/loginHistory.js';
import Visualization from './visualization.js';


class Home extends Component {

    constructor(props) {
        super(props);
        this.saveLoginData = this.saveLoginData.bind(this);
        this.state = {loginData: null, isHistoryTableLoading: true, loginHistoryData: [], stack: false, collapse: false};
        this.logout = this.logout.bind(this);
        this.loginHistory = new LoginHistory();
        this.getLoginHistory = this.getLoginHistory.bind(this);
        this.stack = this.stack.bind(this);
        this.visualization = this.visualization.bind(this);
        this.toggle = this.toggle.bind(this);
    }

    toggle() {
        this.setState({ collapse: !this.state.collapse });
    }

    saveLoginData(loginData) {
        this.setState({loginData: loginData});
        this.props.saveLoginData(loginData);
    }

    logout() {
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
        }
        this.toggle();
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
        return (
            <div>
                {
                    this.props.loginData && !this.state.stack && !this.state.visualization &&
                    <div>
                        <h1 align="center">Welcome {this.props.loginData.userName}</h1>
                        <Container>
                        <Row>
                            <Col>
                                <Button onClick={this.getLoginHistory} >Click to view login history</Button>
                            </Col>
                            <Col>
                                <Button href="https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15" target="_blank">Go to Stackoverflow</Button>
                            </Col>
                            <Col>
                                <Button onClick={this.visualization} >Click to view visualization</Button>
                            </Col>
                            <Col>
                                <Button onClick={this.logout}>Logout</Button>
                            </Col>
                        </Row>
                        <Row>
                            <Jumbotron>
                                <p>
                                   This is a social behaviour logging application. Some of the interactions you do on the stackoverflow pages will be tracked.
                                </p> 
                                <p>
                                    The following user interactions will be tracked: 
                                </p>
                                <li>
                                    <b>Click on question link:</b> By tracking this, the questions user interested in stackoverflow can be analyzed. 
                                </li>
                                <li>
                                    <b>Upvoting:</b> By tracking this, we can analyze the sentiment of this user towards a post or question. 
                                </li>
                                <li>
                                    <b>Downvoting:</b> By tracking this, we can analyze the sentiment of this user towards a post or question.  
                                </li>
                                <li>
                                    <b>Marking a post as favorite:</b> By tracking this, we can understand the user's inclinity towards the kind of posts and can be used for recommendation. 
                                </li>
                                <li>
                                    <b>Tags accessed:</b> By tracking this, we can understand the tags which closely related to the user based on the frequency which can further be used for recommendation. 
                                </li>
                            </Jumbotron>
                        </Row>
                        <Row>
                        {
                            !this.state.isHistoryTableLoading &&
                            <Collapse isOpen={this.state.collapse}>
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
                            </Collapse>
                        }
                        </Row>
                        </Container>
                    </div>
                }
                {
                    !this.props.loginData &&
                    <Login 
                        loginData={this.state.loginData}
                        saveLoginData={this.saveLoginData}/>
                }
                {
                    /*
                    this.state.stack &&
                    <Stack 
                        loginData={this.props.loginData}
                        saveLoginData={this.saveLoginData}/>
                    */
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