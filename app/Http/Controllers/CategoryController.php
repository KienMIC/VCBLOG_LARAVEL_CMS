<?php

namespace App\Http\Controllers;

use App\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::orderBy('id','DESC')->get();
        return view('admin.category.index',compact('categories'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.category.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request,[
           'thumbnail'=>'required',
           'name'=>'required|unique:categories',
            ],
            [
                'thumbnail.required'=>'Nhập URL Thumbnail',
                'name.required'=>'Nhập tên',
                'name.unique'=>'Phân loại bài viết này đã tồn tại'
        ]);

        $category = new Category();
        $category->thumbnail = $request->thumbnail;
        $category->user_id = Auth::id();
        $category->name = $request->name;
        $category->slug = str_slug($request->name);
        $category->is_published = $request->is_published;
        $category->save();

        Session::flash('message','Tạo phân loại bài viết thành công !');
        return redirect()->route('categories.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function edit(Category $category)
    {
        return view('admin.category.edit',compact('category'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Category $category)
    {
        $this->validate($request,[
            'thumbnail'=>'required',
            'name'=>'required|unique:categories,name',
        ],
            [
                'thumbnail.required'=>'Nhập URL Thumbnail',
                'name.required'=>'Nhập tên',
                'name.unique'=>'Phân loại bài viết này đã tồn tại'
            ]);

        $category->thumbnail = $request->thumbnail;
        $category->user_id = Auth::id();
        $category->name = $request->name;
        $category->slug = str_slug($request->name);
        $category->is_published = $request->is_published;
        $category->save();

        Session::flash('message','Cập nhật phân loại bài viết thành công !');
        return redirect()->route('categories.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy(Category $category)
    {
        $category->delete();

        Session::flash('delete-message','Đã xóa phân loại bài viết thành công !');
        return redirect()->route('categories.index');
    }
}