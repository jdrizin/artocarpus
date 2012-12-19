/* clean up collectiondata:
      ^ *fix family/genus/species
        *decide what "project" means
        */
ALTER TABLE collectiondata 
    CHANGE MostRecentFamily collFamily varchar(100),
    CHANGE MostRecentGenus collGenus varchar(100),
    CHANGE MostRecentSpecies collSpecies varchar(500),
    CHANGE MostRecentAltID collAltID varchar(5000),
    CHANGE MostRecentIDNotes collIDNotes varchar(5000);

/* clean up herbarium
        *remove extraneous keys
        *re-import the good dates
        *move statedep, country, elevation to the right places 
        */

/* images:
        remove extraneous keys
        */


/* geospatial:
        *change field descriptors
        *show a pretty php map (as action)
        *use google maps?
        */


/* annotations
        *remove extraneous keys
        */


/* genetic project
        *merge with extractions?
