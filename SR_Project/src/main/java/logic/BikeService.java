package logic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.StationDao;

@Service
public class BikeService {
	@Autowired
	private StationDao stationDao;

	public List<Station> stationList() {
		return stationDao.list();
	}

}
