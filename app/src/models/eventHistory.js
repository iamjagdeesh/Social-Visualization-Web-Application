import CancelableOperation from './cancelable.js';
import Axios from 'axios';

export default class EventHistory extends CancelableOperation {

    async getEventHistoryForEvent(userId, eventName) {

        let data;
        try {
            let response = await Axios.get('/aw/getEventHistoryHourCountForUserAndEvent?userId='+userId+'&eventName='+eventName);
            data = response.data;
        } catch (err) {
            if(!Axios.isCancel(err)){
                throw err;
            }
        }
        return data;

    }

    async getTagCountForUser(userId) {

        let data;
        try {
            let response = await Axios.get('/aw/getTagCountForUser?userId='+userId);
            data = response.data;
        } catch (err) {
            if(!Axios.isCancel(err)){
                throw err;
            }
        }
        return data;

    }
}