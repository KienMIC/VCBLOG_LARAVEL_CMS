<?php

namespace App\Http\Controllers;

use App\Category;
use App\Mail\VisitorContact;
use App\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;

class WebsiteController extends Controller
{
    //Show full bai viet o trang chu
    public function index(){
        $categories = Category::orderBy('name','ASC')->where('is_published','1')->get();
        $posts = Post::orderBy('id','DESC')->where('post_type','post')->where('is_published','1')->paginate(5);
        return view('website.index',compact('posts','categories'));
    }
    //Show noi dung chi tiet tung bai viet
    public function post($slug){
        $post = Post::where('slug',$slug)->where('post_type','post')->where('is_published','1')->first();
        if($post){
            return view('website.post',compact('post'));
        }else{
            return \Reponse::view('website.errors.404',array(), 404);
        }
    }
    //Show bai viet theo category
    public function category($slug){
        $category = Category::where('slug',$slug)->where('is_published','1')->first();
        $posts = $category->posts()->orderBy('posts.id','DESC')->where('is_published','1')->paginate(5);
        if($category){
            return view('website.category',compact('category','posts'));
        }else{
            return \Reponse::view('website.errors.404',array(), 404);
        }
    }

    public function page($slug){
        $page = Post::where('slug',$slug)->where('post_type','page')->where('is_published','1')->first();
        if($page){
            return view('website.page',compact('page'));
        }else{
            return \Reponse::view('website.errors.404',array(), 404);
        }
    }

    public function showContactForm(){
        return view('website.contact');
    }

    public function submitContactForm(Request $request){
        $data = [
            'name' => $request->name,
            'email' => $request->email,
            'tel' => $request->tel,
            'message' => $request->message,
        ];

        Mail::to('kienhp1hp@gmail.com')->send(new VisitorContact($data));

        Session::flash('message', 'Thank you for your email');
        return redirect()->route('contact.show');
    }
}