import React, { Component } from 'react';
import { Row, Col, Container, Button } from 'reactstrap';
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
        if(this.state.isLineDataLoading) {
            lineChartData = await this.eventHistory.getEventHistoryForEvent(this.props.loginData.userId, "question-link");
            console.log(lineChartData.type);
            this.setState({lineChartData: lineChartData, isLineDataLoading: false});
            console.log(lineChartData);
        }
        let barChartData;
            barChartData = await this.eventHistory.getTagCountForUser(this.props.loginData.userId);
            console.log(barChartData.type);
            this.setState({barChartData: barChartData, isBarDataLoading: false});
            console.log(barChartData);

        let areaChartData;
        if(this.state.isAreaDataLoading) {
            areaChartData = await this.eventHistory.getEventHistoryForEvent(this.props.loginData.userId, "favorite");
            console.log(areaChartData.type);
            this.setState({areaChartData: areaChartData, isAreaDataLoading: false});
            console.log(areaChartData);
        }
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

        const data1 = [
            {name: 'Page A', uv: 4000, pv: 2400, amt: 2400},
            {name: 'Page B', uv: 3000, pv: 1398, amt: 2210},
            {name: 'Page C', uv: 2000, pv: 9800, amt: 2290},
            {name: 'Page D', uv: 2780, pv: 3908, amt: 2000},
            {name: 'Page E', uv: 1890, pv: 4800, amt: 2181},
            {name: 'Page F', uv: 2390, pv: 3800, amt: 2500},
            {name: 'Page G', uv: 3490, pv: 4300, amt: 2100},
        ];

        const data = [
            {
                "eventName": "question-link",
                "timeOfDay": "After Midnight (12am-6am)",
                "count": 0
            },
            {
                "eventName": "question-link",
                "timeOfDay": "Morning (6am-12noon)",
                "count": 0
            },
            {
                "eventName": "question-link",
                "timeOfDay": "Afternoon (12noon-6pm)",
                "count": 0
            },
            {
                "eventName": "question-link",
                "timeOfDay": "Night (6pm-12am)",
                "count": 8
            }
        ];

        return(
            <div>
                {
                    this.props.loginData &&
                    <div>
                        <Button onClick={this.getEventHistoryForEvent}>Show Visualization 1</Button>
                        <Container>
                            <Row>
                                <Col md="6">
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
                                <Col md="6">
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
                                <Col>
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
                        </Container>
                    </div>
                }
            </div>
        );
    }
}

export default Visualization;