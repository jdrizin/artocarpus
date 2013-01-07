#transfer the geneticproject table to extractions

#get rid of dummy data
TRUNCATE extractions;

#add relevant columns to extractions
ALTER TABLE extractions
    ADD COLUMN leafTakenDNA VARCHAR(50),
    ADD COLUMN extractionCode VARCHAR(200) AFTER extractionDate;

#start shifting data
UPDATE extractions as ex, geneticproject as gp
    SET ex =gp.geneticID,
    SET =gp.SampleTypeExtractedFrom,
    SET ex.leafTakenDNA=gp.LeafTakenDNA,
    SET ex.ExtractorName=gp.Extractor,
    SET ex.extractionCode=gp.Extractioncode,
    SET ex. =gp.ExtractionDate
    
