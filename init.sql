CREATE INDEX idx_point_geom ON planet_osm_point USING GIST (way);
