import React, { Component } from 'react';
import { Row, Col, Container } from 'reactstrap';
import { LineChart, Line, XAxis, YAxis, CartesianGrid, Tooltip, Legend, BarChart, Bar, AreaChart, Area } from 'recharts';

class Visualization extends Component {

    constructor(props) {
        super(props);
        this.saveLoginData = this.saveLoginData.bind(this);
        this.state = {loginData: null, lineChartData: null};
        this.logout = this.logout.bind(this);
    }

    componentDidMount() {

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

        const data = [
            {name: 'Page A', uv: 4000, pv: 2400, amt: 2400},
            {name: 'Page B', uv: 3000, pv: 1398, amt: 2210},
            {name: 'Page C', uv: 2000, pv: 9800, amt: 2290},
            {name: 'Page D', uv: 2780, pv: 3908, amt: 2000},
            {name: 'Page E', uv: 1890, pv: 4800, amt: 2181},
            {name: 'Page F', uv: 2390, pv: 3800, amt: 2500},
            {name: 'Page G', uv: 3490, pv: 4300, amt: 2100},
        ];

        return(
            <div>
                {
                    this.props.loginData &&
                    <div>
                        <Container>
                            <Row>
                                <Col md="6">
                                    <LineChart width={600} height={300} data={data}
                                        margin={{top: 5, right: 30, left: 20, bottom: 5}}>
                                        <XAxis dataKey="name"/>
                                        <YAxis/>
                                        <CartesianGrid strokeDasharray="3 3"/>
                                        <Tooltip/>
                                        <Legend />
                                        <Line type="monotone" dataKey="pv" stroke="#8884d8" activeDot={{r: 8}}/>
                                        <Line type="monotone" dataKey="uv" stroke="#82ca9d" />
                                    </LineChart>
                                </Col>
                                <Col md="6">
                                    <BarChart width={600} height={300} data={data}
                                    margin={{top: 5, right: 30, left: 20, bottom: 5}}>
                                        <CartesianGrid strokeDasharray="3 3"/>
                                        <XAxis dataKey="name"/>
                                        <YAxis/>
                                        <Tooltip/>
                                        <Legend />
                                        <Bar dataKey="pv" fill="#8884d8" />
                                        <Bar dataKey="uv" fill="#82ca9d" />
                                    </BarChart>
                                </Col>
                            </Row>
                            <Row>
                                <Col>
                                    <AreaChart width={600} height={400} data={data}
                                    margin={{top: 10, right: 30, left: 0, bottom: 0}}>
                                        <CartesianGrid strokeDasharray="3 3"/>
                                        <XAxis dataKey="name"/>
                                        <YAxis/>
                                        <Tooltip/>
                                        <Area type='monotone' dataKey='uv' stroke='#8884d8' fill='#8884d8' />
                                    </AreaChart>
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