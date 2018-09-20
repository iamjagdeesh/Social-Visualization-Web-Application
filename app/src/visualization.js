import React, { Component } from 'react';
import { Row, Col, Container, Button, Jumbotron } from 'reactstrap';
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend, BarChart, Bar, AreaChart, Area } from 'recharts';

import EventHistory from './models/eventHistory.js';

class Visualization extends Component {

    constructor(props) {
        super(props);
        this.saveLoginData = this.saveLoginData.bind(this);
        this.state = {
            loginData: null, 
            isLineDataLoading: true, 
            isBarDataLoading: true, 
            isAreaDataLoading: true, 
            lineChartData: null,
            barChartData: null,
            areaChartData: null
        };
        this.eventHistory = new EventHistory();
        this.getEventHistoryForEvent = this.getEventHistoryForEvent.bind(this);
        this.logout = this.logout.bind(this);
    }

    /*
    componentDidMount() {
        let lineChartData;
        if(this.state.isLineDataLoading) {
            lineChartData = this.eventHistory.getEventHistoryForEvent(this.props.loginData.userId, "question-link");
            console.log(lineChartData.type);
            this.setState({lineChartData: lineChartData, isLineDataLoading: false});
            console.log(lineChartData);
        }
    }
    */

    async getEventHistoryForEvent(e) {
        e.preventDefault();
        let lineChartData;
            lineChartData = await this.eventHistory.getEventHistoryForEvent(this.props.loginData.userId, "question-link");
            console.log(lineChartData.type);
            this.setState({lineChartData: lineChartData, isLineDataLoading: false});
            console.log(lineChartData);
        let barChartData;
            barChartData = await this.eventHistory.getTagCountForUser(this.props.loginData.userId);
            console.log(barChartData.type);
            this.setState({barChartData: barChartData, isBarDataLoading: false});
            console.log(barChartData);

        let areaChartData;
            areaChartData = await this.eventHistory.getEventHistoryForEvent(this.props.loginData.userId, "vote-up");
            console.log(areaChartData.type);
            this.setState({areaChartData: areaChartData, isAreaDataLoading: false});
            console.log(areaChartData);
        return
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
                        <Container>
                            <Row justify="center">
                                <Col md={{size: 2, offset: 4}}>
                                <Button onClick={this.getEventHistoryForEvent}>Load Visualizations (Also click to reload with live data)</Button>
                                </Col>
                            </Row>
                            <Row justify="between">
                                <Col md={{size: 8, offset: 2}}>
                                    {
                                        !this.isLineDataLoading && this.state.lineChartData &&
                                        <LineChart width={600} height={300} data={this.state.lineChartData}
                                            margin={{top: 5, right: 30, left: 20, bottom: 5}}>
                                            <XAxis dataKey="timeOfDay"/>
                                            <YAxis/>
                                            <CartesianGrid strokeDasharray="3 3"/>
                                            <Tooltip/>
                                            <Legend />
                                            <Line type="monotone" dataKey="count" stroke="#8884d8" activeDot={{r: 8}}/>
                                        </LineChart>
                                    }
                                </Col>
                            </Row>
                            <Row>
                                <Col md={{size: 8, offset: 2}}>
                                {
                                    !this.isLineDataLoading && this.state.lineChartData &&
                                    <Jumbotron>
                                        <h2>Question Access vs Time of Day</h2>
                                        <li>
                                        The above visualization shows the time of the day on x-asis and the number of questions accessed on y-axis.
                                        </li>
                                        <li>
                                        This visualization is a representation of user behaviour with respect to the questions he/she reads during the different durations in the day. 
                                        </li>
                                        <li>
                                        With this visualization, we can analyze the behaviour of the user at different durations.
                                        </li>
                                        <li>
                                        We can analyze at what time the user is most active.
                                        </li>
                                    </Jumbotron>
                                }
                                </Col>
                            </Row>
                            <Row justify="center">
                                <Col md={{size: 8, offset: 2}}>
                                    {
                                        !this.isBarDataLoading && this.state.barChartData &&
                                        <BarChart width={600} height={300} data={this.state.barChartData}
                                        margin={{top: 5, right: 30, left: 20, bottom: 5}}>
                                            <CartesianGrid strokeDasharray="3 3"/>
                                            <XAxis dataKey="tag"/>
                                            <YAxis/>
                                            <Tooltip/>
                                            <Legend />
                                            <Bar dataKey="count" fill="#8884d8" />
                                        </BarChart>
                                    }
                                </Col>
                            </Row>
                            <Row>
                                <Col md={{size: 8, offset: 2}}>
                                {
                                    !this.isBarDataLoading && this.state.barChartData &&
                                    <Jumbotron>
                                        <h2>Tag frequency vs Tags</h2>
                                        <li>
                                        The above visualization shows the popular tags accessed by user on x-asis and the frequency of each on y-axis.                                        </li>
                                        <li>
                                        This visualization is a representation user tag relationship.
                                        </li>
                                        <li>
                                        With this visualization, we can find the affinity of the user with the tags and recommendation can be provided based on that.
                                        </li>
                                        <li>
                                        We can analyze the tags closely related to the user and recommend posts with similar tags.
                                        </li>
                                    </Jumbotron>
                                }
                                </Col>
                            </Row>
                            <Row justify="center">
                                <Col md={{size: 8, offset: 2}}>
                                    {
                                        !this.isAreaDataLoading && this.state.areaChartData &&
                                        <AreaChart width={600} height={400} data={this.state.areaChartData}
                                        margin={{top: 10, right: 30, left: 0, bottom: 0}}>
                                            <CartesianGrid strokeDasharray="3 3"/>
                                            <XAxis dataKey="timeOfDay"/>
                                            <YAxis/>
                                            <Tooltip/>
                                            <Area type='monotone' dataKey='count' stroke='#8884d8' fill='#8884d8' />
                                        </AreaChart>
                                    }
                                </Col>
                            </Row>
                            <Row>
                                <Col md={{size: 8, offset: 2}}>
                                {
                                    !this.isAreaDataLoading && this.state.areaChartData &&
                                    <Jumbotron>
                                        <h2>Up-vote frequency vs Time of day</h2>
                                        <li>
                                        The above visualization shows the time of the day on x-asis and the number of upvotes done on y-axis.
                                        </li>
                                        <li>
                                        This visualization is a representation of user behaviour with respect to the upvotes he/she does during the different durations in the day.
                                        </li>
                                        <li>
                                        With this visualization, we can analyze the sentiments of the users at different durations.
                                        </li>
                                        <li>
                                        This can also be used to provide ads and other recommendations as its a time with positive sentiments of the user.                                        
                                        </li>
                                    </Jumbotron>
                                }
                                </Col>
                            </Row>
                        </Container>
                    </div>
                }
            </div>
        );
    }
}

export default Visualization;