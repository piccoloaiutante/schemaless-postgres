CREATE TABLE tud  (path ltree);
INSERT INTO tud VALUES ('TUD');
INSERT INTO tud VALUES ('TUD.Art');
INSERT INTO tud VALUES ('TUD.Art.CreativeArts');
INSERT INTO tud VALUES ('TUD.Art.CreativeArts.ProductDesign');
INSERT INTO tud VALUES ('TUD.Art.CreativeArts.FineArts');
INSERT INTO tud VALUES ('TUD.Art.CreativeArts.InteriorDesign');
INSERT INTO tud VALUES ('TUD.Art.Food');
INSERT INTO tud VALUES ('TUD.Art.Food.CulinaryArts');
INSERT INTO tud VALUES ('TUD.Art.Food.Baking');
INSERT INTO tud VALUES ('TUD.Art.Turism');
INSERT INTO tud VALUES ('TUD.Art.Turism.EventManagment');
INSERT INTO tud VALUES ('TUD.Art.Turism.TurismMarketing');
INSERT INTO tud VALUES ('TUD.Art.Languages_Law_SocialScience');
INSERT INTO tud VALUES ('TUD.Art.Languages_Law_SocialScience.InternationaBusinessLanguage');
INSERT INTO tud VALUES ('TUD.Art.Media');
INSERT INTO tud VALUES ('TUD.Art.Media.GameDesign');
INSERT INTO tud VALUES ('TUD.Art.Media.FilmBroadcasting');
INSERT INTO tud VALUES ('TUD.Art.Conservatory');
INSERT INTO tud VALUES ('TUD.Art.Conservatory.Composition');
INSERT INTO tud VALUES ('TUD.Business');
INSERT INTO tud VALUES ('TUD.Business.Accounting_Finance');
INSERT INTO tud VALUES ('TUD.Business.Accounting_Finance.BusinessFinance');
INSERT INTO tud VALUES ('TUD.Business.Accounting_Finance.Macroeconomics');
INSERT INTO tud VALUES ('TUD.Business.Marketing');
INSERT INTO tud VALUES ('TUD.Business.Marketing.MarketingPractice');
INSERT INTO tud VALUES ('TUD.Business.Marketing.InternationalMarketing');
INSERT INTO tud VALUES ('TUD.Business.Management');
INSERT INTO tud VALUES ('TUD.Business.Management.Logistics');
INSERT INTO tud VALUES ('TUD.Business.Management.SupplyChainManagement');
INSERT INTO tud VALUES ('TUD.Business.Retail');
INSERT INTO tud VALUES ('TUD.Business.Retail.RetailAnalytics');
INSERT INTO tud VALUES ('TUD.Business.Retail.RetailMarketing');
INSERT INTO tud VALUES ('TUD.Science');
INSERT INTO tud VALUES ('TUD.Science.Pharmaceutical_Chemistry_Forensic.Biotechnology');
INSERT INTO tud VALUES ('TUD.Science.Pharmaceutical_Chemistry_Forensic.BasicMicrobiology');
INSERT INTO tud VALUES ('TUD.Science.BiologicalScience');
INSERT INTO tud VALUES ('TUD.Science.BiologicalScience.MolecularBiology');
INSERT INTO tud VALUES ('TUD.Science.BiologicalScience.ScientificProject');
INSERT INTO tud VALUES ('TUD.Science.Food_Nutrition');
INSERT INTO tud VALUES ('TUD.Science.Food_Nutrition.FoodMicrobiology');
INSERT INTO tud VALUES ('TUD.Science.Food_Nutrition.Food_Beverage');
INSERT INTO tud VALUES ('TUD.Science.HealthCare');
INSERT INTO tud VALUES ('TUD.Science.HealthCare.OpticalDispensing');
INSERT INTO tud VALUES ('TUD.Science.HealthCare.BinocularVision');
INSERT INTO tud VALUES ('TUD.Science.Physics');
INSERT INTO tud VALUES ('TUD.Science.Physics.Relativity');
INSERT INTO tud VALUES ('TUD.Science.Physics.QuantumMechanics');
INSERT INTO tud VALUES ('TUD.Science.Mathematics');
INSERT INTO tud VALUES ('TUD.Science.Mathematics.Geometry');
INSERT INTO tud VALUES ('TUD.Science.Mathematics.RealAnalisys');
INSERT INTO tud VALUES ('TUD.Science.Computing');
INSERT INTO tud VALUES ('TUD.Science.Computing.Databases');
INSERT INTO tud VALUES ('TUD.Science.Computing.CloudComputing');
INSERT INTO tud VALUES ('TUD.Engineering');
INSERT INTO tud VALUES ('TUD.Engineering.BuiltEngineering.AutomitiveManagement');
INSERT INTO tud VALUES ('TUD.Engineering.BuiltEngineering.PropertyStudies');
INSERT INTO tud VALUES ('TUD.Engineering.Architecture');
INSERT INTO tud VALUES ('TUD.Engineering.Architecture.ArchitecturalTechnology');
INSERT INTO tud VALUES ('TUD.Engineering.Architecture.ConstrutionStieManagement');
INSERT INTO tud VALUES ('TUD.Engineering.StructuralEngineering');
INSERT INTO tud VALUES ('TUD.Engineering.StructuralEngineering.CivilEngineering');
INSERT INTO tud VALUES ('TUD.Engineering.MultidisciplinaryTechnology');
INSERT INTO tud VALUES ('TUD.Engineering.MultidisciplinaryTechnology.Modelling');
INSERT INTO tud VALUES ('TUD.Engineering.MultidisciplinaryTechnology.BIM');
INSERT INTO tud VALUES ('TUD.Engineering.ElectronicalEngineering');
INSERT INTO tud VALUES ('TUD.Engineering.ElectronicalEngineering.ElectricalPower');
INSERT INTO tud VALUES ('TUD.Engineering.ElectronicalEngineering.Control');
INSERT INTO tud VALUES ('TUD.Engineering.Transport');
INSERT INTO tud VALUES ('TUD.Engineering.Transport.SpatialPlanning');
INSERT INTO tud VALUES ('TUD.Engineering.Transport.LocalDevelopment');
INSERT INTO tud VALUES ('TUD.Engineering.Design');
INSERT INTO tud VALUES ('TUD.Engineering.Design.DesignInnovation');
INSERT INTO tud VALUES ('TUD.Engineering.Design.CreativeDesignStudio');
CREATE INDEX path_gist_idx ON tud USING gist(path);
CREATE INDEX path_idx ON tud USING btree(path);