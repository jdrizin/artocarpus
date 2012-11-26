#some nifty queries

#select records where MostRecentGenus/Species doesn't match with Genus/Species
select ID,MostRecentGenus,MostRecentSpecies,Genus,Species
	FROM collectiondata WHERE MostRecentGenus <> Genus 
	OR MostRecentSpecies <> Species;

#or individually, with less output
select ID,MostRecentGenus,Genus FROM collectiondata 
	WHERE MostRecentGenus <> Genus;

select ID,MostRecentSpecies,Species FROM collectiondata 
	WHERE MostRecentSpecies <> Species; 
