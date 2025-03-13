CLASS zjl_data_generator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZJL_DATA_GENERATOR IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA ls_mitarbeiter TYPE zjl_mitarbeiter.
    DATA lt_mitarbeiter TYPE TABLE OF zjl_mitarbeiter.

    DATA ls_urlaubantrag TYPE zjl_urlaubantrag.
    DATA lt_urlaubantrag TYPE TABLE OF zjl_urlaubantrag.

    DATA ls_urlaubsan TYPE zjl_urlaubsan.
    DATA lt_urlaubsan TYPE TABLE OF zjl_urlaubsan.

    "Variablen zwischen speichern um Urlaubsantrag zu befüllen mit Antragsteller und Genehmigender
    DATA: lv_id_hans TYPE zjl_mitarbeiter-id,
          lv_id_lisa TYPE zjl_mitarbeiter-id,
          lv_id_petra TYPE zjl_mitarbeiter-id.

    " Delete Travels
    DELETE FROM zjl_mitarbeiter.
    out->write( |Deleted Mitarbeiter: { sy-dbcnt }| ).

    " Delete Travels
    DELETE FROM zjl_urlaubantrag.
    out->write( |Deleted Urlaubsanträge: { sy-dbcnt }| ).

    " Delete Travels
    DELETE FROM zjl_urlaubsan.
    out->write( |Deleted Urlaubsansprüche: { sy-dbcnt }| ).

    " Mitarbeiter 1: Hans Maier
    CLEAR ls_mitarbeiter.
    ls_mitarbeiter-client        = sy-mandt.                          " Mandant
    ls_mitarbeiter-id            = cl_system_uuid=>create_uuid_x16_static( ). " Eindeutige ID
    lv_id_hans = ls_mitarbeiter-id.
    ls_mitarbeiter-mitarbeiter_nr = '000001'.                         " Mitarbeitermummer 1
    ls_mitarbeiter-vorname       = 'Hans'.                            " Vorname
    ls_mitarbeiter-nachname      = 'Maier'.                           " Nachname
    ls_mitarbeiter-eintrittsdatum = '20000501'.                       " Eintrittsdatum 01.05.2000
    GET TIME STAMP FIELD ls_mitarbeiter-erstellt_am.                  " Erstellungszeitstempel
    ls_mitarbeiter-erstellt_von  = sy-uname.                          " Benutzer, der den Eintrag erstellt
    GET TIME STAMP FIELD ls_mitarbeiter-geaendert_am.                 " Änderungszeitstempel
    ls_mitarbeiter-geaendert_von = sy-uname.                          " Benutzer, der den Eintrag geändert hat
    APPEND ls_mitarbeiter TO lt_mitarbeiter.

    "Urlaubsanspruch Hans Maier 2022
    Clear ls_urlaubsan.
    ls_urlaubsan-client = sy-mandt.
    ls_urlaubsan-id     = cl_system_uuid=>create_uuid_x16_static( ).
    ls_urlaubsan-mitarbeiter = lv_id_hans.
    ls_urlaubsan-jahr = 2022.
    ls_urlaubsan-urlaubstage = 30.
    GET TIME STAMP FIELD ls_urlaubsan-erstellt_am.
    ls_urlaubsan-erstellt_von = sy-uname.
    GET TIME STAMP FIELD ls_urlaubsan-geaendert_am.
    ls_urlaubsan-geaendert_von = sy-uname.
    APPEND ls_urlaubsan to lt_urlaubsan.

    "Urlaubsanspruch Hans Maier 2023
    Clear ls_urlaubsan.
    ls_urlaubsan-client = sy-mandt.
    ls_urlaubsan-id     = cl_system_uuid=>create_uuid_x16_static( ).
    ls_urlaubsan-mitarbeiter = lv_id_hans.
    ls_urlaubsan-jahr = 2023.
    ls_urlaubsan-urlaubstage = 30.
    GET TIME STAMP FIELD ls_urlaubsan-erstellt_am.
    ls_urlaubsan-erstellt_von = sy-uname.
    GET TIME STAMP FIELD ls_urlaubsan-geaendert_am.
    ls_urlaubsan-geaendert_von = sy-uname.
    APPEND ls_urlaubsan to lt_urlaubsan.



    " Mitarbeiter 2: Lisa Müller
    CLEAR ls_mitarbeiter.
    ls_mitarbeiter-client        = sy-mandt.                          " Mandant
    ls_mitarbeiter-id            = cl_system_uuid=>create_uuid_x16_static( ). " Eindeutige ID
    lv_id_lisa = ls_mitarbeiter-id.
    ls_mitarbeiter-mitarbeiter_nr = '000002'.                         " Mitarbeitermummer 2
    ls_mitarbeiter-vorname       = 'Lisa'.                            " Vorname
    ls_mitarbeiter-nachname      = 'Müller'.                          " Nachname
    ls_mitarbeiter-eintrittsdatum = '20100701'.                       " Eintrittsdatum 01.07.2010
    GET TIME STAMP FIELD ls_mitarbeiter-erstellt_am.                  " Erstellungszeitstempel
    ls_mitarbeiter-erstellt_von  = sy-uname.                          " Benutzer, der den Eintrag erstellt
    GET TIME STAMP FIELD ls_mitarbeiter-geaendert_am.                 " Änderungszeitstempel
    ls_mitarbeiter-geaendert_von = sy-uname.                          " Benutzer, der den Eintrag geändert hat
    APPEND ls_mitarbeiter TO lt_mitarbeiter.

    "Urlaubsanspruch Lisa Müller 2023
    Clear ls_urlaubsan.
    ls_urlaubsan-client = sy-mandt.
    ls_urlaubsan-id     = cl_system_uuid=>create_uuid_x16_static( ).
    ls_urlaubsan-mitarbeiter = lv_id_lisa.
    ls_urlaubsan-jahr = 2023.
    ls_urlaubsan-urlaubstage = 30.
    GET TIME STAMP FIELD ls_urlaubsan-erstellt_am.
    ls_urlaubsan-erstellt_von = sy-uname.
    GET TIME STAMP FIELD ls_urlaubsan-geaendert_am.
    ls_urlaubsan-geaendert_von = sy-uname.
    APPEND ls_urlaubsan to lt_urlaubsan.

    " Mitarbeiter 3: Petra Schmid
    CLEAR ls_mitarbeiter.
    ls_mitarbeiter-client        = sy-mandt.                          " Mandant
    ls_mitarbeiter-id            = cl_system_uuid=>create_uuid_x16_static( ). " Eindeutige ID
    lv_id_petra = ls_mitarbeiter-id.
    ls_mitarbeiter-mitarbeiter_nr = '000003'.                         " Mitarbeitermummer 3
    ls_mitarbeiter-vorname       = 'Petra'.                           " Vorname
    ls_mitarbeiter-nachname      = 'Schmid'.                          " Nachname
    ls_mitarbeiter-eintrittsdatum = '20231001'.                       " Eintrittsdatum 01.10.2023
    GET TIME STAMP FIELD ls_mitarbeiter-erstellt_am.                  " Erstellungszeitstempel
    ls_mitarbeiter-erstellt_von  = sy-uname.                          " Benutzer, der den Eintrag erstellt
    GET TIME STAMP FIELD ls_mitarbeiter-geaendert_am.                 " Änderungszeitstempel
    ls_mitarbeiter-geaendert_von = sy-uname.                          " Benutzer, der den Eintrag geändert hat
    APPEND ls_mitarbeiter TO lt_mitarbeiter.

     "Urlaubsanspruch Petra Schmid 2023
    Clear ls_urlaubsan.
    ls_urlaubsan-client = sy-mandt.
    ls_urlaubsan-id     = cl_system_uuid=>create_uuid_x16_static( ).
    ls_urlaubsan-mitarbeiter = lv_id_petra.
    ls_urlaubsan-jahr = 2023.
    ls_urlaubsan-urlaubstage = 7.
    GET TIME STAMP FIELD ls_urlaubsan-erstellt_am.
    ls_urlaubsan-erstellt_von = sy-uname.
    GET TIME STAMP FIELD ls_urlaubsan-geaendert_am.
    ls_urlaubsan-geaendert_von = sy-uname.
    APPEND ls_urlaubsan to lt_urlaubsan.


    "Urlaubsanträge befüllen, mit der id von den Mitarbeitern
    ls_urlaubantrag-client = sy-mandt.
    ls_urlaubantrag-id = cl_system_uuid=>create_uuid_x16_static( ).
    ls_urlaubantrag-antragsteller = lv_id_hans.
    ls_urlaubantrag-startdatum = '20220701'.
    ls_urlaubantrag-enddatum = '20220710'.
    ls_urlaubantrag-urlaubstage = 8.
    ls_urlaubantrag-genehmigender = lv_id_lisa.
    ls_urlaubantrag-kommentar = 'Sommerurlaub'.
    ls_urlaubantrag-status = 'G'.
     GET TIME STAMP FIELD ls_urlaubantrag-erstellt_am.
    ls_urlaubantrag-erstellt_von = sy-uname.
    GET TIME STAMP FIELD ls_urlaubantrag-geaendert_am.
    ls_urlaubantrag-geaendert_von = sy-uname.
    APPEND ls_urlaubantrag to lt_urlaubantrag.

    ls_urlaubantrag-client = sy-mandt.
    ls_urlaubantrag-id = cl_system_uuid=>create_uuid_x16_static( ).
    ls_urlaubantrag-antragsteller = lv_id_hans.
    ls_urlaubantrag-startdatum = '20221227'.
    ls_urlaubantrag-enddatum = '20221230'.
    ls_urlaubantrag-urlaubstage = 4.
    ls_urlaubantrag-genehmigender = lv_id_lisa.
    ls_urlaubantrag-kommentar = 'Weihnachtsurlaub'.
    ls_urlaubantrag-status = 'A'.
     GET TIME STAMP FIELD ls_urlaubantrag-erstellt_am.
    ls_urlaubantrag-erstellt_von = sy-uname.
    GET TIME STAMP FIELD ls_urlaubantrag-geaendert_am.
    ls_urlaubantrag-geaendert_von = sy-uname.
    APPEND ls_urlaubantrag to lt_urlaubantrag.

    ls_urlaubantrag-client = sy-mandt.
    ls_urlaubantrag-id = cl_system_uuid=>create_uuid_x16_static( ).
    ls_urlaubantrag-antragsteller = lv_id_hans.
    ls_urlaubantrag-startdatum = '20221228'.
    ls_urlaubantrag-enddatum = '20221230'.
    ls_urlaubantrag-urlaubstage = 3.
    ls_urlaubantrag-genehmigender = lv_id_lisa.
    ls_urlaubantrag-kommentar = 'Weihnachsturlaub (2. Versuch)'.
    ls_urlaubantrag-status = 'G'.
     GET TIME STAMP FIELD ls_urlaubantrag-erstellt_am.
    ls_urlaubantrag-erstellt_von = sy-uname.
    GET TIME STAMP FIELD ls_urlaubantrag-geaendert_am.
    ls_urlaubantrag-geaendert_von = sy-uname.
    APPEND ls_urlaubantrag to lt_urlaubantrag.

    ls_urlaubantrag-client = sy-mandt.
    ls_urlaubantrag-id = cl_system_uuid=>create_uuid_x16_static( ).
    ls_urlaubantrag-antragsteller = lv_id_hans.
    ls_urlaubantrag-startdatum = '20250527'.
    ls_urlaubantrag-enddatum = '20230614'.
    ls_urlaubantrag-urlaubstage = 14.
    ls_urlaubantrag-genehmigender = lv_id_lisa.
    ls_urlaubantrag-kommentar = ''.
    ls_urlaubantrag-status = 'G'.
     GET TIME STAMP FIELD ls_urlaubantrag-erstellt_am.
    ls_urlaubantrag-erstellt_von = sy-uname.
    GET TIME STAMP FIELD ls_urlaubantrag-geaendert_am.
    ls_urlaubantrag-geaendert_von = sy-uname.
    APPEND ls_urlaubantrag to lt_urlaubantrag.

    ls_urlaubantrag-client = sy-mandt.
    ls_urlaubantrag-id = cl_system_uuid=>create_uuid_x16_static( ).
    ls_urlaubantrag-antragsteller = lv_id_hans.
    ls_urlaubantrag-startdatum = '20231220'.
    ls_urlaubantrag-enddatum = '20231231'.
    ls_urlaubantrag-urlaubstage = 8.
    ls_urlaubantrag-genehmigender = lv_id_lisa.
    ls_urlaubantrag-kommentar = 'Winterurlaub'.
    ls_urlaubantrag-status = 'B'.
     GET TIME STAMP FIELD ls_urlaubantrag-erstellt_am.
    ls_urlaubantrag-erstellt_von = sy-uname.
    GET TIME STAMP FIELD ls_urlaubantrag-geaendert_am.
    ls_urlaubantrag-geaendert_von = sy-uname.
    APPEND ls_urlaubantrag to lt_urlaubantrag.

    ls_urlaubantrag-client = sy-mandt.
    ls_urlaubantrag-id = cl_system_uuid=>create_uuid_x16_static( ).
    ls_urlaubantrag-antragsteller = lv_id_petra.
    ls_urlaubantrag-startdatum = '20231227'.
    ls_urlaubantrag-enddatum = '20231231'.
    ls_urlaubantrag-urlaubstage = 3.
    ls_urlaubantrag-genehmigender = lv_id_hans.
    ls_urlaubantrag-kommentar = 'Weihnachtsurlaub'.
    ls_urlaubantrag-status = 'B'.
     GET TIME STAMP FIELD ls_urlaubantrag-erstellt_am.
    ls_urlaubantrag-erstellt_von = sy-uname.
    GET TIME STAMP FIELD ls_urlaubantrag-geaendert_am.
    ls_urlaubantrag-geaendert_von = sy-uname.
    APPEND ls_urlaubantrag to lt_urlaubantrag.
















     INSERT ZJL_Urlaubsan FROM TABLE @lt_urlaubsan.
    out->write( |Inserted Urlaubsansprüche: { sy-dbcnt }| ).

    INSERT ZJL_Mitarbeiter FROM TABLE @lt_mitarbeiter.
    out->write( |Inserted Mitarbeiter: { sy-dbcnt }| ).

    INSERT ZJL_Urlaubantrag FROM TABLE @lt_urlaubantrag.
    out->write( |Inserted Urlaubsanträge: { sy-dbcnt }| ).



  ENDMETHOD.
ENDCLASS.
