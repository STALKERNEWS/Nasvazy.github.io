<?php

/**
 * @author Idris
 * @copyright Hire-Experts LLC
 * @version Wall 3.1
 */

$page = "user_followers_new";
include "header.php";

$list_id = $_REQUEST['list_id'];
$follower_ids = $_REQUEST['contacts'];
$choosed = $_REQUEST['contacts_choosed'];
$start = isset($_REQUEST['start']) ? $_REQUEST['start'] : 0;
$is_ajax = $_REQUEST['is_ajax'];
$task = $_REQUEST['task'];

$callback_js = "window.parent.he_wall_following.added_followers";

if ( $choosed )
{
    $is_error = 0;
    
    $follower_ids = explode(',', $follower_ids);
    $result_array = array();
    $result_array['html'] = "";
    $count = 0;
    
    foreach ($follower_ids as $fid)
    {
        if (!he_wall::follow_user($user->user_info['user_id'], $fid, $list_id))
        {
            $result_array['status'] = 0;
        }
        else 
        {
            $count++;
            $result_array['status'] = 1;
            $smarty->assign('follower', he_wall::get_user_info($fid));
            $smarty->assign('list_id', $list_id);
            $result_array['html'] .= he_wall_include_footer_logic('he_wall_follower.tpl');
        }
    }
    
    $result_array['count'] = $count;
    
    if ($is_error != 0) 
    {
        SE_Language::_preload($is_error); 
        SE_Language::load(); 
        $message = SE_Language::_get($is_error); 
    }
    else 
    {
        $message = SE_Language::_get(690706157); // TODO lang
    }
    
    $result_array['message'] = $message;
    
    // SEND AJAX CONFIRMATION
    he_print_json($result_array);
}

$limit = 16; // TODO per page followers

if ($task == "get_more_followers")
{
    $start += $limit;
}

$he_contacts = new he_contacts();
$follower_info = he_wall::get_followers_in_list( $user->user_info['user_id'], 0, $list_id, $start, $limit );

$contacts = $follower_info['followers'];
$smarty->assign_by_ref( 'contacts', $contacts );
$more_contacts_existed = $follower_info['follower_count'] >= $limit ? true : false;
$contacts_compiled = $contacts ? $smarty->fetch( 'he_contacts_list.tpl' ) : '';

if( $is_ajax ) 
{
    he_print_json( array( 'html_code'=> $contacts_compiled, 'more' => $more_contacts_existed, 'start' => $start ) );
}

$list_info = he_wall::list_info( $list_id );

$smarty->assign( 'callback_js', $callback_js );
$smarty->assign( 'emails_allowed', 0 );
$smarty->assign( 'more_contacts_existed', $more_contacts_existed );
$smarty->assign( 'last', 0 );
$smarty->assign( 'callback_url', 'user_followers_new.php?list_id='.$list_id.'&contacts_choosed=1&' );
$smarty->assign( 'get_contacts_url', 'user_followers_new.php?list_id='.$list_id.'&task=get_more_followers&contacts_choosed=0&' );
$smarty->assign( 'message_allowed', 0 );
$smarty->assign( 'contacts_compiled', $contacts_compiled );
$smarty->assign( 'list_info', $list_info );

include "footer.php";

?>