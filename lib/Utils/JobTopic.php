<?php
/**
 * Created by PhpStorm.
 * User: fregini
 * Date: 30/01/2019
 * Time: 15:16
 */

class JobTopic {
    public static function publish( $message ) {
        $amq = new AMQHandler() ;
        $amq->sendTopic('job_events', $message ) ;
    }
}