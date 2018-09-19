import React from 'react';
import './App.css';
import { Navbar, Nav, NavbarToggler, NavbarBrand, NavItem, Collapse } from 'reactstrap';
import {
  NavLink
} from 'react-router-dom';

class MainNav extends React.Component {
  constructor(props) {
    super(props);

    this.toggle = this.toggle.bind(this);
    this.state = {
      isOpen: false
    };
  }
  toggle() {
    this.setState({
      isOpen: !this.state.isOpen
    });
  }
  render() {
    return (
      <div>
        <Navbar color="light" light expand="md">
          <NavbarBrand href="#">Social visualization with behavior logging</NavbarBrand>
          <NavbarToggler onClick={this.toggle} />
          <Collapse isOpen={this.state.isOpen} navbar>
            <Nav className="ml-auto" navbar>
              <NavItem>
                <NavLink className="nav-link" exact to="/login">Login</NavLink>
              </NavItem>
              <NavItem>
                <NavLink className="nav-link" exact to="/register">Register</NavLink>
              </NavItem>
            </Nav>
          </Collapse>
        </Navbar>
      </div>
    );
  }
}

export default MainNav;