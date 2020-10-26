@extends('website.template.master')

@section('content')
    <!-- Page Header -->
    <header class="masthead" style="background-image: url({{ asset('website/img/contact-bg.jpg') }})">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <div class="page-heading">
                        <h1>Liên lạc với tôi</h1>
                        <span class="subheading"></span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-md-10 mx-auto">
                <p>Điền đầy đủ thông tin vào mẫu dưới đây. Tôi sẽ trả lời bạn sớm!</p>

                @if(Session::has('message'))
                    <div class="alert alert-success">
                        {{Session('message')}}
                    </div>
                @endif
            <!-- Contact Form - Enter your email address on line 19 of the mail/contact_me.php file to make this form work. -->
                <!-- WARNING: Some web hosts do not allow emails to be sent through forms to common mail hosts like Gmail or Yahoo. It's recommended that you use a private domain email address! -->
                <!-- To use the contact form, your site must be on a live web host with PHP! The form will not work locally! -->
                {!! Form::open(['route' => 'contact.submit']) !!}
                <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                        <label>Tên</label>
                        <input type="text" name="name" class="form-control" placeholder="Tên" id="name" required
                               data-validation-required-message="Vui lòng nhập tên">
                        <p class="help-block text-danger"></p>
                    </div>
                </div>
                <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                        <label>Địa chỉ Email</label>
                        <input type="email" name="email" class="form-control" placeholder="Địa chỉ Email" id="email" required
                               data-validation-required-message="Vui lòng nhập Email">
                        <p class="help-block text-danger"></p>
                    </div>
                </div>
                <div class="control-group">
                    <div class="form-group col-xs-12 floating-label-form-group controls">
                        <label>Số điện thoại</label>
                        <input type="tel" name="tel" class="form-control" placeholder="Số điện thoại" id="phone" required
                               data-validation-required-message="Vui lòng nhập số điện thoại">
                        <p class="help-block text-danger"></p>
                    </div>
                </div>
                <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                        <label>Message</label>
                        <textarea rows="5" name="message" class="form-control" placeholder="Tin nhắn" id="message" required
                                  data-validation-required-message="Please enter a message."></textarea>
                        <p class="help-block text-danger"></p>
                    </div>
                </div>
                <br>
                <div id="success"></div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary" id="sendMessageButton">GỬI</button>
                </div>
                {!! Form::close() !!}
            </div>
        </div>
    </div>
@endsection()
