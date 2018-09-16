import CancelableOperation from './cancelable.js';
import Axios from 'axios';

export default class UserProfile extends CancelableOperation {
    
    async login(userId, password) {
        
        var payload={
            "userId":userId,
            "password":password
        }

        let data;
        try {
            let response = await Axios.post('/aw/login', payload);
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