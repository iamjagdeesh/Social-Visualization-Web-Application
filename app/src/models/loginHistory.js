import CancelableOperation from './cancelable.js';
import Axios from 'axios';

export default class LoginHistory extends CancelableOperation {

    async getLoginHistory(userId) {

        let data;
        try {
            let response = await Axios.get('/aw/getLoginHistory?userId='+userId);
            console.log(response.data);
            data = response.data;
        } catch (err) {
            if(!Axios.isCancel(err)){
                throw err;
            }
        }
        return data;

    }
}