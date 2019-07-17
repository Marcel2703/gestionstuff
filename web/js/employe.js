
        function afficheNumErreur(message) {
                        $( "#erreurNomEmploye" ).fadeOut(1000);
                        $( "#erreurAdrEmploye" ).fadeOut(1000);
                        $("#erreurNumEmploye").html("<span class='glyphicon glyphicon-warning-sign'></span> " + message);
                        $( "#erreurNumEmploye" ).fadeIn(1000);
        }
        
        function afficheNomErreur(message) {
                        $( "#erreurNumEmploye" ).fadeOut(1000);
                        $( "#erreurAdrEmploye" ).fadeOut(1000);
                        $("#erreurNomEmploye").html("<span class='glyphicon glyphicon-warning-sign'></span> " + message);
                        $( "#erreurNomEmploye" ).fadeIn(1000);
        }
        
        function afficheAdrErreur(message) {
                        $( "#erreurNumEmploye" ).fadeOut(1000);
                        $( "#erreurNomEmploye" ).fadeOut(1000);
                        $("#erreurAdrEmploye").html("<span class='glyphicon glyphicon-warning-sign'></span> " + message);
                        $( "#erreurAdrEmploye" ).fadeIn(1000);
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
                            window.location.assign("http://localhost:8080/GestionEmploye/employe.jsp");
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
                            supprEmpl(num);
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
        function supprEmpl(num){
            $.ajax({
                url: "http://localhost:8080/GestionEmploye/actionSupprEmp.jsp?numGetSuppr=" + num + "",
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
		var num = $("#numEmploye").val();
		var nom = $("#nomEmploye").val();
                var adr = $("#adrEmploye").val();
                var bt = $("#btnAjouter").val();
                    
		if(num === ""){
                    afficheNumErreur("Veuillez compléter ce champs");
		}
                else if(!num.match(/^E[0-9]+$/))
		{
                    afficheNumErreur('Le n° doit commencer par E et suivie de chiffres');
		}
                else if(nom === ""){
                    afficheNomErreur("Veuillez compléter ce champs");
                }
                else if(adr===""){
                    afficheAdrErreur("Veuillez compléter ce champs")
                }
                else{
                    $.ajax({
                        url: "http://localhost:8080/GestionEmploye/actionEmploye.jsp",
                        type: "POST",
                        data: {numEmploye: num, nomEmploye: nom, adrEmploye: adr, btn: bt},
                        success: function(data) 
				{
                                    if(data==='existe'){
                                        afficheNumErreur('Ce code existe déjà');
                                    }
                                    else{
                                    ouvrirDialogAjout();
                                }
                                },
                        error: function(){
                                    alert("erreur");
                                }
			});
                }
	});
        
        //MODIFICATION
        $('#btnModifier').on('click',function() {
                
		var num = $("#numEmploye").val();
		var nom = $("#nomEmploye").val();
                var adr = $("#adrEmploye").val();
                var bt = $("#btnModifier").val();
		if(num === ""){
                    afficheNumErreur("Veuillez compléter ce champs");
                }
                else if(!num.match(/^E[0-9]+$/))
		{
                    afficheNumErreur('Le n° doit commencer par E et suivie de chiffres');
		}
                else if(nom === ""){
                    afficheNomErreur("Veuillez compléter ce champs");
                }
                else if(adr === ""){
                    afficheAdrErreur("Veuillez compléter ce champs")
                }
                else{
                    $.ajax({
                        url: "http://localhost:8080/GestionEmploye/actionEmploye.jsp",
                        type: "POST",
                        data: {numEmploye: num, nomEmploye: nom, adrEmploye: adr, btn: bt},
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