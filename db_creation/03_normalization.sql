#i'm doing some normalization here and there. the code in here reflects that, but
#don't run this as a script, just copy and paste the lines.

#create the new geospatial table, steal values from collectiondata
CREATE TABLE geospatial (geoID INT(6), LocationInfo VARCHAR(5000),
	Habitat VARCHAR(5000),StateDepProv VARCHAR(500),Country VARCHAR(500),
	GPS VARCHAR(5000),Latitude VARCHAR(500),Longitude VARCHAR(500),
	Elevation VARCHAR(500),LatLongEstAccuracy VARCHAR(500),
	LatLongEstNotes VARCHAR(500));

#insert the old data
INSERT INTO geospatial
SELECT	ID, LocationInfo, Habitat, StateDepProv, Country, GPS, 
	Latitude, Longitude, Elevation, LatLongEstAccuracy, LatLongEstNotes
	FROM collectiondata;

#forgot to make the ID not-null and auto-increment


#add the foreign key
ALTER TABLE geospatial
	ADD fk_geospatial_collection_ID INT(6);
UPDATE geospatial
	SET fk_geospatial_collection_ID=geoID;
ALTER TABLE geospatial
	ADD FOREIGN KEY (fk_geospatial_collection_ID)
	REFERENCES collectiondata(ID);

#now remove the data from from collectiondata
ALTER TABLE collectiondata
	DROP LocationInfo, 
	DROP Habitat,
	DROP StateDepProv,
	DROP Country,
	DROP GPS, 
	DROP Latitude,
	DROP Longitude,
	DROP Elevation,
	DROP LatLongEstAccuracy,
	DROP LatLongEstNotes;
