
        function afficheNumErreur(message) {
                        $( "#erreurNbHeures" ).fadeOut(1000);
                        $( "#erreurTaux" ).fadeOut(1000);
                        $( "#erreurDate" ).fadeOut(1000);
                        $("#erreurNum").html("<span class='glyphicon glyphicon-warning-sign'></span> " + message);
                        $( "#erreurNum" ).fadeIn(1000);
        }
        
        function afficheNbErreur(message) {
                        $( "#erreurNum" ).fadeOut(1000);
                        $( "#erreurTaux" ).fadeOut(1000);
                        $( "#erreurDate" ).fadeOut(1000);
                        $("#erreurNbHeures").html("<span class='glyphicon glyphicon-warning-sign'></span> " + message);
                        $( "#erreurNbHeures" ).fadeIn(1000);
        }
        
        function afficheTauxErreur(message) {
                        $( "#erreurNum" ).fadeOut(1000);
                        $( "#erreurNbHeures" ).fadeOut(1000);
                        $( "#erreurDate" ).fadeOut(1000);
                        $("#erreurTaux").html("<span class='glyphicon glyphicon-warning-sign'></span> " + message);
                        $( "#erreurTaux" ).fadeIn(1000);
        }
        
        function afficheDateErreur(message) {
                        $( "#erreurNum" ).fadeOut(1000);
                        $( "#erreurNbHeures" ).fadeOut(1000);
                        $( "#erreurTaux" ).fadeOut(1000);
                        $("#erreurDate").html("<span class='glyphicon glyphicon-warning-sign'></span> " + message);
                        $( "#erreurDate" ).fadeIn(1000);
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
                            window.location.assign("http://localhost:8080/GestionEmploye/travail.jsp");
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
                            supprTrav(num);
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
        function supprTrav(num){
            $.ajax({
                url: "http://localhost:8080/GestionEmploye/actionSupprTrav.jsp?numGetSuppr=" + num + "",
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
		var num = $("#numTravail").val();
		var num1 = $("#numEmploye").val();
		var num2 = $("#numEntreprise").val();
		var nbHeures = $("#nbHeures").val();
                var tauxHoraires = $("#tauxHoraires").val();
                var dateEmbauche = $("#dateEmbauche").val();
                var bt = $("#btnAjouter").val();
                
		if(num === ""){
                    afficheNumErreur("Veuillez compléter ce champs");
		}
                else if(!num.match(/^TR[0-9]+$/))
		{
                    afficheNumErreur('Le n° doit commencer par TR et suivie de chiffres');
		}
                else if(nbHeures === ""){
                    afficheNbErreur("Veuillez compléter ce champs");
                }
                else if(!nbHeures.match(/^[0-9]+$/)){
                    afficheNbErreur("Donnée invalide");
                }
                else if(tauxHoraires === ""){
                    afficheTauxErreur("Veuillez compléter ce champs")
                }
                else if(dateEmbauche === ""){
                    afficheDateErreur("Veuillez compléter ce champs")
                }
                else{
                    $.ajax({
                        url: "http://localhost:8080/GestionEmploye/actionTravail.jsp",
                        type: "POST",
                        data: {numTravail: num, numEmploye: num1, numEntreprise: num2, nbHeures: nbHeures, tauxHoraires: tauxHoraires, dateEmbauche: dateEmbauche, btn: bt},
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
                var num = $("#numTravail").val();
		var num1 = $("#numEmploye").val();
		var num2 = $("#numEntreprise").val();
		var nbHeures = $("#nbHeures").val();
                var tauxHoraires = $("#tauxHoraires").val();
                var dateEmbauche = $("#dateEmbauche").val();
                var bt = $("#btnModifier").val();
		if(num === ""){
                    afficheNumErreur("Veuillez compléter ce champs");
		}
                else if(!num.match(/^TR[0-9]+$/))
		{
                    afficheNumErreur('Le n° doit commencer par TR et suivie de chiffres');
		}
                else if(nbHeures === ""){
                    afficheNbErreur("Veuillez compléter ce champs");
                }
                else if(!nbHeures.match(/^[0-9]+$/)){
                    afficheNbErreur("Donnée invalide");
                }
                else if(tauxHoraires === ""){
                    afficheTauxErreur("Veuillez compléter ce champs")
                }
                else if(dateEmbauche === ""){
                    afficheDateErreur("Veuillez compléter ce champs")
                }
                else{
                    $.ajax({
                        url: "http://localhost:8080/GestionEmploye/actionTravail.jsp",
                        type: "POST",
                        data: {numTravail: num, numEmploye: num1, numEntreprise: num2, nbHeures: nbHeures, tauxHoraires: tauxHoraires, dateEmbauche: dateEmbauche, btn: bt},
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