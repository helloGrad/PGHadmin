
var index=0;


	//박가혜 2017-08-30
	$(function() {
	
		
		
		
		$('input:checkbox[name="cdlist"]').each(function() {
			for (var i = 0; i < codeList.length; i++) {
				
				if (codeList[i].cdId == this.value) {
					
					this.checked = true; //checked 처리
					
				}
			}
		});
		
		for (var i = 0; i < codeList.length; i++) {
			
			
			if(codeList[i].cdDstnct == '연구분야'){
				
				var name = codeList[i].cdNm;
	    		var no = codeList[i].cdId;
	    		
	    		checkList.push(name);
	    		
	    		$("#cdNmList").append("<div id='"+no+"'><span id='cdNm' name='cdNm' val='"+no+"'>"+name+"</span>" +
	    				"<button id='deleteBtn' type='button' onclick='clickDelete(\""+no+"\");' class='btn'>X</button>" +
	    						"<input type='hidden' name='codes["+index+"].cdId' value='"+no+"'>" +
	    						"<input type='hidden' name='codes["+index+"].cdNm' value='"+name+"'>" +
	    						"</div>")
				
	    	index++;					
			}
			
			
			
		}
		
		var type = $("#type").val()
		if(type=="학과"||type=="연구실"){
			fetchListByType(type);
		}
		

		   $.extend($.ui.autocomplete.prototype, {
               _renderMenu: function (ul, items) {
                   //remove scroll event to prevent attaching multiple scroll events to one container element
                   $(ul).unbind("scroll");
                   var self = this;
                   self._scrollMenu(ul, items);
                   
               },

               _scrollMenu: function (ul, items) {
                   var self = this;
                   var maxShow = 5;
                   var results = [];
                   var pages = Math.ceil(items.length / maxShow);
                   results = items.slice(0, maxShow);

                   
                   if (pages > 1) {
                       $(ul).scroll(function () {
                           if (isScrollbarBottom($(ul))) {
                               ++window.pageIndex;
                               if (window.pageIndex >= pages) return;

                               results = items.slice(window.pageIndex * maxShow, window.pageIndex * maxShow + maxShow);

                               //append item to ul
                               $.each(results, function (index, item) {
                               	console.log("index111",index);
                               	console.log("item1111>>", item)
                               	console.log(ul)
                                   self._renderItemData(ul, item);
                               });
                               
                               console.log("ul>>id", $(ul).attr('id'));
                               $('#' + $(ul).attr('id') + " li").addClass('ui-menu-item');
                               $( ul ).find( "li div" ).addClass( "ui-menu-item-wrapper" );
                               //refresh menu
                               console.log("123>>",self.menu)
                               if (typeof(self.menu.deactivate) == "function")
                               	self.menu.deactivate();
                               
                               self.menu.refresh();
                               // size and position menu
                               ul.show();
                               self._resizeMenu();
                               ul.position($.extend({
                                   of: self.element
                               }, self.options.position));
                               if (self.options.autoFocus) {
                                   self.menu.next(new $.Event("mouseover"));
                               }
                           }
                       });
                   }

                   $.each(results, function (index, item) {
                   	console.log("index222",index);
                   	console.log("item222>>", item)

                   	$(item).addClass("ui-menu-item");
                       self._renderItemData(ul, item);
                   });
               }
           });
           
           function isScrollbarBottom(container) {
                var height = container.outerHeight();
                var scrollHeight = container[0].scrollHeight;
                var scrollTop = container.scrollTop();
                if (scrollTop >= scrollHeight - height) {
                    return true;
                }
                return false;
            };

		
		
	    
	    $( "#tags" ).autocomplete({
	    	minLength: 0,
	    	source: function(request, response) {
	    		$("#duplicateMsg").css("display","none");
	            var results = $.ui.autocomplete.filter(availableTags, request.term);

	            if (!results.length) {
	                results = [NoResultsMsg];
	            }
	            
	            response(results);
	        },
	        select: function(event, ui, request, response){
	        	
	        	if(checkDuplicate(ui.item.label)){
            		$("#duplicateMsg").css("display","block");
            		$("#tags").select();
            		return;
            	}
	        	
	        	if(ui.item.label===NoResultsMsg){
	        		event.preventDefault();
	        	}else{
	        		var name = ui.item.label
	        		var no = findNo(ui.item.label);
	        		$("#cdNmList").append("<div id='"+resultSet[no]["cdId"]+"'><span id='cdNm' name='cdNm' val='"+resultSet[no]["cdId"]+"'>"+resultSet[no]["cdNm"]	+"</span>" +
	        				"<button id='deleteBtn' type='button' onclick='clickDelete(\""+resultSet[no]['cdId']+"\");' class='btn'>X</button>" +
	        						"<input type='hidden' name='codes["+index+"].cdId' value='"+resultSet[no]["cdId"]+"'>" +
	        						"<input type='hidden' name='codes["+index+"].cdNm' value='"+resultSet[no]["cdNm"]+"'>" +
	        						"</div>")
	        		checkList.push(ui.item.label);
	        		index ++;
	        		return;
	        		//선택된거 리스트에서 삭제
//	        		availableTags.splice(availableTags.indexOf(name),1)
	        	}
	        },
	        minLength: 0,
            delay: 0
	    }).focus(function () {
            window.pageIndex = 0;
            $(this).autocomplete("search");
        });
	  
	    $( "#tags" ).click(function() {
	    	$("#tags").val("");
            $("#tags").autocomplete("search");

	    });
		
		
		
		
	});
	
	var availableTags = new Array();
	var resultSet = new Array();
	var NoResultsMsg = "검색 결과가 없음";
	var checkList = [];
	
	
	var clickDelete=function(id){
		delete checkList[checkList.indexOf($("#"+id+" span").text())];
		$("#"+id).remove();
	}

	var checkDuplicate = function(name){
		
		for(var i=0;i<checkList.length;i++){
			if(checkList[i]===name){
				return true;
			}
		}
		return false;
		
	}

	var fetchListByType=function(type){
		
		$.ajax({
			url : "/admin/organz/api/getcode?type="+type,
			type : "get",
			dataType : "json",
			data : "",
			success : function(response) {
				console.log(response.data)
				for(var i=0;i<response.data.length;i++){
//					availableTags.push(response.data[i].cdNm)
					resultSet = response.data;
					availableTags.push(resultSet[i]["cdNm"]);
				}
			},
			error : function(jqXHR, status, e) {
				console.error(status + " : " + e);
			}
		});
		
	};

	var findNo=function(name){
		for(var i=0;i<availableTags.length;i++){
			if(availableTags[i]===name){
				return i;
			}
		}
	}

	
