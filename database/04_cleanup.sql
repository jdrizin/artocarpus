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

#move things around
ALTER TABLE herbarium
    MODIFY COLUMN Elevation VARCHAR(500) AFTER LocationInfo;

ALTER TABLE herbarium
    MODIFY COLUMN Country VARCHAR(500) AFTER Habitat,
    MODIFY COLUMN StateDepProv VARCHAR(500) AFTER Habitat;

ALTER TABLE herbarium
    MODIFY COLUMN fk_herbarium_collection_ID INT(6) AFTER herbKEY;

#remove the extraneous herbID
ALTER TABLE herbarium
    DROP COLUMN herbID;

/* images:
        remove extraneous keys
        */
ALTER TABLE images
    DROP COLUMN imageID,
    MODIFY COLUMN fk_images_collection_ID INT(6) AFTER imagesKEY;

/* geospatial:
        *change field descriptors
        *show a pretty php map (as action)
        *use google maps?
        */
ALTER TABLE geospatial
    MODIFY COLUMN fk_geospatial_collection_ID INT(6) AFTER geospatialKEY,
    DROP COLUMN geoID;

/* annotations
        *remove extraneous keys
        */


/* genetic project
        *merge with extractions?
