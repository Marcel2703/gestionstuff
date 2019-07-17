
function affichePeriodeErreur() {
        $( "#erreurNomEmploye" ).fadeOut(1000);
        $( "#erreurAdrEmploye" ).fadeOut(1000);
        $("#erreurNumEmploye").html("<span class='glyphicon glyphicon-warning-sign'></span> Veuillez compléter les champs");
        $( "#erreurNumEmploye" ).fadeIn(1000);
}

$('#btnEnvoyer').on('click',function() {
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