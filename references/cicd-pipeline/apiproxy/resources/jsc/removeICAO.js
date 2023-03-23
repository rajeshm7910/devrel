const allAirports = JSON.parse(context.getVariable("response.content"));
if (allAirports instanceof Array) {
    filtered = allAirports.map(u => ({rank: u.rank, airport: u.airport, location: u.location, country: u.country, iata: u.iata }));
    context.setVariable("response.content", JSON.stringify(filtered));
} else {
    delete allAirports.icao;
    context.setVariable("response.content", JSON.stringify(allAirports));
}
