
        function afficheNumErreur(message) {
                        $( "#erreurDesignEntreprise" ).fadeOut(1000);
                        $( "#erreurLocalEntreprise" ).fadeOut(1000);
                        $("#erreurNumEntreprise").html("<span class='glyphicon glyphicon-warning-sign'></span> " + message);
                        $( "#erreurNumEntreprise" ).fadeIn(1000);
        }
        
        function afficheDesignErreur(message) {
                        $( "#erreurNumEntreprise" ).fadeOut(1000);
                        $( "#erreurLocalEntreprise" ).fadeOut(1000);
                        $("#erreurDesignEntreprise").html("<span class='glyphicon glyphicon-warning-sign'></span> " + message);
                        $( "#erreurDesignEntreprise" ).fadeIn(1000);
        }
        
        function afficheLocalErreur(message) {
                        $( "#erreurNumEntreprise" ).fadeOut(1000);
                        $( "#erreurDesignEntreprise" ).fadeOut(1000);
                        $("#erreurLocalEntreprise").html("<span class='glyphicon glyphicon-warning-sign'></span> " + message);
                        $( "#erreurLocalEntreprise" ).fadeIn(1000);
        }
        
        function rechargePage(){
            $(':input')
                    .not(':button, :submit, :reset, :hidden')
                    .val('')
                    .prop('checked', false)
                    .prop('selected', false);
            location.reload();
        }
        
        function ouvrirDialogAjout(){
            $( "#dialogAjout" ).dialog({
                autoOpen: false,
                hide: 1000,
                show: 1000,
                draggable: false,
                resizable: false,
                modal: true,
                width: 400,
                buttons: [
                    {
                        text: "Ok",
                        click: function() {
                            $( this ).dialog( "close" );
                            rechargePage();
                        }
                    }
                ]
            });
            $( "#dialogAjout" ).dialog( "open" );
            event.preventDefault();
        }
        
        function ouvrirDialogModif(){
            $( "#dialogModifier" ).dialog({
                autoOpen: false,
                hide: 1000,
                show: 1000,
                draggable: false,
                resizable: false,
                modal: true,
                width: 400,
                buttons: [
                    {
                        text: "Ok",
                        click: function() {
                            $( this ).dialog( "close" );
                            window.location.assign("http://localhost:8080/GestionEmploye/entreprise.jsp");
                        }
                    }
                ]
            });
            $( "#dialogModifier" ).dialog( "open" );
            event.preventDefault();
        }
        
        function ouvrirDialogSuppr(num){
            $( "#dialogSuppr" ).dialog({
                autoOpen: false,
                hide: 1000,
                show: 1000,
                draggable: false,
                resizable: false,
                modal: true,
                width: 400,
                buttons: [
                    {
                        text: "Oui",
                        click: function() {
                            $( this ).dialog( "close" );
                            supprEntr(num);
                        }
                    },
                            {
                        text: "Non",
                                click: function() {
                            $( this ).dialog( "close" );
                        }
                    }
                ]
            });
            
            $( "#dialogSuppr" ).dialog( "open" );
            event.preventDefault();
        }
        
        function ouvrirDialogInfoSuppr(){
            $( "#dialogInfoSuppr" ).dialog({
                autoOpen: false,
                hide: 1000,
                show: 1000,
                draggable: false,
                resizable: false,
                modal: true,
                width: 400,
                buttons: [
                    {
                        text: "Ok",
                        click: function() {
                            $( this ).dialog( "close" );
                            location.reload();
                        }
                    }
                ]
            });
            $( "#dialogInfoSuppr" ).dialog( "open" );
            event.preventDefault();
        }
        
        //SUPPRESSION
        function supprEntr(num){
            $.ajax({
                url: "http://localhost:8080/GestionEmploye/actionSupprEntr.jsp?numGetSuppr=" + num + "",
                type: "GET",
                data: {numGetSuppr: num},
                success: function(data) 
                {
                    ouvrirDialogInfoSuppr();
                    location.reload();
                },
                        error: function(){
                    alert("erreur");
                }
            });
        }

	//AJOUT
	$('#btnAjouter').on('click',function() {
		var num = $("#numEntreprise").val();
		var design = $("#designEntreprise").val();
                var local = $("#localEntreprise").val();
                var bt = $("#btnAjouter").val();
                    
		if(num === ""){
                    afficheNumErreur("Veuillez compléter ce champs");
		}
                else if(!num.match(/^ENT[0-9]+$/))
		{
                    afficheNumErreur('Le n° doit commencer par ENT et suivie de chiffres');
		}
                else if(design === ""){
                    afficheDesignErreur("Veuillez compléter ce champs");
                }
                else if(local===""){
                    afficheLocalErreur("Veuillez compléter ce champs")
                }
                else{
                    $.ajax({
                        url: "http://localhost:8080/GestionEmploye/actionEntreprise.jsp",
                        type: "POST",
                        data: {numEntreprise: num, designEntreprise: design, localEntreprise: local, btn: bt},
                        success: function() 
				{
                                    ouvrirDialogAjout();
                                },
                        error: function(){
                                    alert("erreur");
                                }
			});
                }
	});
        
        //MODIFICATION
        $('#btnModifier').on('click',function() {
                
		var num = $("#numEntreprise").val();
		var design = $("#designEntreprise").val();
                var local = $("#localEntreprise").val();
                var bt = $("#btnModifier").val();
		if(num === ""){
                    afficheNumErreur("Veuillez compléter ce champs");
                }
                else if(!num.match(/^ENT[0-9]+$/))
		{
                    afficheNumErreur('Le n° doit commencer par ENT et suivie de chiffres');
		}
                else if(design === ""){
                    afficheDesignErreur("Veuillez compléter ce champs");
                }
                else if(local === ""){
                    afficheLocalErreur("Veuillez compléter ce champs")
                }
                else{
                    $.ajax({
                        url: "http://localhost:8080/GestionEmploye/actionEntreprise.jsp",
                        type: "POST",
                        data: {numEntreprise: num, designEntreprise: design, localEntreprise: local, btn: bt},
                        success: function(data) 
				{
                                    ouvrirDialogModif();
                                },
                        error: function(){
                                    alert("erreur");
                                }
			});
                }
	});