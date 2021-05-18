


CREATE VIEW [adw].[vw_Dashboard_AttribMembership]
AS

-- By Client, AcctType
SELECT ClientKey, ClientName, AttribAcctType, EffYr, EffMth
	,CONCAT(EffYr,CONVERT(char(2),cast(EffMth as datetime), 101)) as EffYYYYMM
	,CONCAT(EffYr, '-', CONVERT(char(2),cast(EffMth as datetime), 101), '-01') as EffDate, COUNT(distinct CONCAT(ClientKey,ClientMemberKey)) as CntRec
	FROM dbo.z_tmp_AttribMembers_FINAL
	WHERE EffectiveAsOfDate = (SELECT MAX(EffectiveAsOfDate) FROM dbo.z_tmp_AttribMembers_FINAL)
GROUP BY ClientKey, ClientName, AttribAcctType,EffYr, EffMth
--ORDER BY ClientKey, ClientName, AttribAcctType,EffYr, EffMth

-- By Client, AcctType, NPI
--SELECT ClientKey, ClientName, AttribAcctType, AttribNPI, NPIName, EffYr, EffMth, COUNT(distinct CONCAT(ClientKey,ClientMemberKey)) as CntRec
--	FROM dbo.z_tmp_AttribMembers_FINAL
--	WHERE EffectiveAsOfDate = @EffectiveAsOfDate1
--GROUP BY ClientKey, ClientName, AttribAcctType, AttribNPI,NPIName, EffYr, EffMth
--ORDER BY ClientKey, ClientName, AttribAcctType, AttribNPI,NPIName, EffYr, EffMth

