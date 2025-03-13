


CLASS lhc_Mitarbeiter DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Mitarbeiter RESULT result.



ENDCLASS.

CLASS lhc_Mitarbeiter IMPLEMENTATION.

  METHOD get_instance_authorizations.

  ENDMETHOD.


ENDCLASS.

CLASS lhc_Urlaubantrag DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Urlaubantrag RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Urlaubantrag RESULT result.

    METHODS approve FOR MODIFY
      IMPORTING keys FOR ACTION Urlaubantrag~approve RESULT result.

    METHODS reject FOR MODIFY
      IMPORTING keys FOR ACTION Urlaubantrag~reject RESULT result.

    METHODS DetermineSTatus FOR DETERMINE ON MODIFY
      IMPORTING keys FOR Urlaubantrag~DetermineSTatus.


ENDCLASS.








CLASS lhc_Urlaubantrag IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD approve.

     DATA message TYPE REF TO zjl_nachrichten.


     Read Entity in local mode ZJL_R_Urlaubantrag
      ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT DATA(urlaubsantrage).



      LOOP AT urlaubsantrage REFERENCE INTO DATA(urlaubsantrag).


      if urlaubsantrag->Status = 'G'.
        message = NEW zjl_nachrichten( textid      = zjl_nachrichten=>error_again
                                  description = urlaubsantrag->Kommentar ).
        APPEND VALUE #( %tky     = urlaubsantrag->%tky
                        %element = VALUE #( Status = if_abap_behv=>mk-on )
                        %msg     = message ) TO reported-urlaubantrag.
        APPEND VALUE #( %tky = urlaubsantrag->%tky ) TO failed-urlaubantrag.
        DELETE urlaubsantrage INDEX sy-tabix.
        CONTINUE.
       ENDIF.

        if urlaubsantrag->Status = 'A'.
        message = NEW zjl_nachrichten( textid      = zjl_nachrichten=>error_again
                                  description = urlaubsantrag->Kommentar ).
        APPEND VALUE #( %tky     = urlaubsantrag->%tky
                        %element = VALUE #( Status = if_abap_behv=>mk-on )
                        %msg     = message ) TO reported-urlaubantrag.
        APPEND VALUE #( %tky = urlaubsantrag->%tky ) TO failed-urlaubantrag.
        DELETE urlaubsantrage INDEX sy-tabix.
        CONTINUE.
       ENDIF.


        if urlaubsantrag->Status = 'B'.
       message = NEW zjl_nachrichten(  severity    = if_abap_behv_message=>severity-success
                                textid      = zjl_nachrichten=>sucess_genehmigen
                                description = urlaubsantrag->Kommentar ).
      APPEND VALUE #( %tky     = urlaubsantrag->%tky
                      %element = VALUE #( Status = if_abap_behv=>mk-on )
                      %msg     = message ) TO reported-urlaubantrag.



         urlaubsantrag->Status = 'G'.
            Modify Entity in local mode ZJL_R_Urlaubantrag
            UPDATE Fields ( Status )
            WITH VALUE #( FOR u IN urlaubsantrage
                         ( %tky = u-%tky Status = u-Status ) ).

      ENDIF.

        ENDLOOP.

        result = VALUE #(  FOR u in urlaubsantrage   ( %tky = u-%tky %param = u )  ).
    ENDMETHOD.



  METHOD reject.

    DATA message TYPE REF TO zjl_nachrichten.

     "Read Urlaubsantrag
     Read Entity in local mode ZJL_R_Urlaubantrag
      ALL FIELDS
         WITH CORRESPONDING #( keys )
         RESULT DATA(urlaubsantrage).


     "Process Urlaubsantrag
      LOOP AT urlaubsantrage REFERENCE INTO DATA(urlaubsantrag).


      if urlaubsantrag->Status = 'G'.
        message = NEW zjl_nachrichten( textid      = zjl_nachrichten=>error_again
                                  description = urlaubsantrag->Kommentar ).
        APPEND VALUE #( %tky     = urlaubsantrag->%tky
                        %element = VALUE #( Status = if_abap_behv=>mk-on )
                        %msg     = message ) TO reported-urlaubantrag.
        APPEND VALUE #( %tky = urlaubsantrag->%tky ) TO failed-urlaubantrag.
        DELETE urlaubsantrage INDEX sy-tabix.
        CONTINUE.
       ENDIF.

        if urlaubsantrag->Status = 'A'.
        message = NEW zjl_nachrichten( textid      = zjl_nachrichten=>error_again
                                  description = urlaubsantrag->Kommentar ).
        APPEND VALUE #( %tky     = urlaubsantrag->%tky
                        %element = VALUE #( Status = if_abap_behv=>mk-on )
                        %msg     = message ) TO reported-urlaubantrag.
        APPEND VALUE #( %tky = urlaubsantrag->%tky ) TO failed-urlaubantrag.
        DELETE urlaubsantrage INDEX sy-tabix.
        CONTINUE.
       ENDIF.


       if urlaubsantrag->Status = 'B'.
       message = NEW zjl_nachrichten(  severity    = if_abap_behv_message=>severity-success
                                textid      = zjl_nachrichten=>sucess_ablehnen
                                description = urlaubsantrag->Kommentar ).
      APPEND VALUE #( %tky     = urlaubsantrag->%tky
                      %element = VALUE #( Status = if_abap_behv=>mk-on )
                      %msg     = message ) TO reported-urlaubantrag.

                      "Hier noch status umschreiben

         urlaubsantrag->Status = 'A'.
            Modify Entity in local mode ZJL_R_Urlaubantrag
            UPDATE Fields ( Status )
            WITH VALUE #( FOR u IN urlaubsantrage
                         ( %tky = u-%tky Status = u-Status ) ).


      ENDIF.

        ENDLOOP.

        result = VALUE #(  FOR u in urlaubsantrage   ( %tky = u-%tky %param = u )  ).

  ENDMETHOD.


  METHOD DetermineSTatus.
   MODIFY ENTITY IN LOCAL MODE ZJL_R_URLAUBANTRAG
           UPDATE FIELDS ( status )
           WITH VALUE #( FOR key IN keys
                         ( %tky   = key-%tky
                           status = 'B' ) ).
  ENDMETHOD.


ENDCLASS.
