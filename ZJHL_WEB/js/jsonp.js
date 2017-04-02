$(function(){
	var imgurl = [];//存放歌手图片
	var gname = [];//存放歌曲名称
	var name = [];//存放歌手名字
	var url = [];//存放歌曲地址
	var onoff=0;//播放器控制开关
	var index = 0;//以上四大数据索引
	var audio = null;//音乐播放对象
	audio = document.createElement('audio');//创建一个共用的播放器

	//音乐初始化
	(function(){
		name.splice(0,name.length);
		gname.splice(0,gname.length);
		imgurl.splice(0,imgurl.length);
		url.splice(0,url.length);
		$.ajax({
			"url":"http://s.music.163.com/search/get/",
			"dataType":"jsonp",
			"data":{
				"type":1,
				"s":'追梦赤子心',
				"limit":10
			},
			"jsonp":"callback",
			"cache":false,
			"success":function(data){
				imgurl.push(data.result.songs[0].album.picUrl);
				url.push(data.result.songs[0].audio);
				gname.push(data.result.songs[0].name);
				name.push(data.result.songs[0].artists[0].name);
				$('ul').append('<li><i>'+gname[0]+'</i><i>'+name[0]+'</i></li>');
				$('ol').append('<li><i>'+gname[0]+'</i><i>'+name[0]+'</i></li>');
				$('.name b').html(gname[0]);
				$('.name i').html(name[0]);
				$('.img').css({background:'url('+imgurl[0]+')',backgroundSize:'100%'});
				$('.box ul li').click(listEv);
				$('ol li').click(listEv);
				audio.src=url[0];
				audio.play();
				$('.navbar i').eq(1).html('&#xe633;');
			}
		});
	})();
	
	//播放器左右收缩
	$('.bar').click(function(ev){
		if($('.music').offset().left==0){
			$('.music').animate({left:'-380px'},300);
		}else{
			$('.music').animate({left:'0px'},300);
		};
		if($('.list').height()=='300'){
			$('.list').animate({height:0},10);
		};
		ev.stopPropagation();
	});

	$('span').click(searchEv);//点击收缩按钮搜索歌曲
	
	//输入完毕后回车搜索
	$('input').keydown(function(ev){
		var ev = ev||window.event;
		if(ev.keyCode=='13'){
			searchEv(ev);
		};
	});

	//点击网页空白隐藏搜索下拉列表
	$('html').click(function(ev){
		$('ul').html('').css({display:'none'});
		ev.stopPropagation();
	});

	//点击播放器列表展示与收缩
	$('.navbar i').eq(3).click(function(ev){
		if($('.list').height()==0){
			$('.list').animate({height:'300px'},300);
		}else{
			$('.list').animate({height:'0'},300);
		};
		ev.stopPropagation();
	});

	//程序核心，搜索事件，触发后跨域请求网易音乐服务器
	function searchEv(ev){
		var vals = $('.box input').val();
		name.splice(0,name.length);
		gname.splice(0,gname.length);
		imgurl.splice(0,imgurl.length);
		url.splice(0,url.length);
		$.ajax({
			"url":"http://s.music.163.com/search/get/",
			"dataType":"jsonp",
			"data":{
				"type":1,
				"s":vals,
				"limit":10
			},
			"jsonp":"callback",
			"cache":false,
			"success":function(data){
				var val = '';
				for(var i=0;i<data.result.songs.length;i++){
					imgurl.push(data.result.songs[i].album.picUrl);
					url.push(data.result.songs[i].audio);
					gname.push(data.result.songs[i].name);
					name.push(data.result.songs[i].artists[0].name);
					val += '<li><i>'+gname[i]+'</i><i>'+name[i]+'</i></li>';
				};
				$('ul').html(val).css({display:'block'});
				$('ol').html(val);
				$('.box ul li').click(listEv);
				$('ol li').click(listEv);	
			}
		});
		ev.stopPropagation();
	};

	$('.navbar i').eq(1).click(function(){
		if(onoff){
			$(this).html('&#xe710;');
			audio.pause();
			onoff=0;
		}else{
			$(this).html('&#xe633;');
			audio.play();
			onoff=1;
		};
	});

	//上一曲
	$('.navbar i').eq(0).click(function(){
		index--;
		if(index<0){index=gname.length-1};
		$('.name b').html(gname[index]);
		$('.name i').html(name[index]);
		$('.img').css({background:'url('+imgurl[index]+')',backgroundSize:'100%'});
		$('.navbar i').eq(1).html('&#xe633;');
		audio.src=url[index];
		audio.play();
	});

	//下一曲
	$('.navbar i').eq(2).click(next);

	//监听歌曲是否播放完毕，播放完毕后触发事件
	audio.onended=function(){next();};

	function next(){ 
		index++;
		if(index>gname.length-1){index=0};
		$('.name b').html(gname[index]);
		$('.name i').html(name[index]);
		$('.img').css({background:'url('+imgurl[index]+')',backgroundSize:'100%'});
		$('.navbar i').eq(1).html('&#xe633;');
		audio.src=url[index];
		audio.play();
	};

	//列表点击播放事件函数
	function listEv(ev){
		index = $(this).index();
		$('.name b').html(gname[index]);
		$('.name i').html(name[index]);
		$('.img').css({background:'url('+imgurl[index]+')',backgroundSize:'100%'});
		
		audio.src=url[index];
		audio.play();
		onoff=1;
		$('.navbar i').eq(1).html('&#xe633;');
		ev.stopPropagation();
	};	
});
console.log('本程序由吴佳编写，程序员QQ：523453335');