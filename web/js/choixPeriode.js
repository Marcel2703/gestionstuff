/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


            function radio1() {
                        var options = {};
                        $( "#anneeMois" ).hide( 'puff', options, 1000);
                        $( "#annee" ).hide( 'puff', options, 1000);
                        $( "#deuxDate" ).show( 'puff', options, 1000);
                      };
                      
            $( "#radioset #radio1" ).click(function() {
                        radio1();
                      });
                      
            function radio2() {
                        var options = {};
                        $( "#deuxDate" ).hide( 'puff', options, 1000);
                        $( "#annee" ).hide( 'puff', options, 1000);
                        $( "#anneeMois" ).show( 'puff', options, 1000);
                      };
                      
            $( "#radioset #radio2" ).click(function() {
                        radio2();
                      });
                      
            function radio3() {
                        var options = {};
                        $( "#anneeMois" ).hide( 'puff', options, 1000);
                        $( "#deuxDate" ).hide( 'puff', options, 1000);
                        $( "#annee" ).show( 'puff', options, 1000);
                      };
                      
            $( "#radioset #radio3" ).click(function() {
                        radio3();
                      });