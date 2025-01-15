

module.exports = (server) => {
  // Install a `/` route that returns server status
  const router = server.loopback.Router();
  router.get('/', server.loopback.status());
  server.use(router);
};

module.exports = (app) => {
  // Run automigrate only if the environment variable AUTO_MIGRATE is set to true
  if (process.env.AUTO_MIGRATE === 'true') {
			const ds = app.dataSources.db;

			ds.automigrate(["Team", "Member"], (err) => {
				if (err) throw err;
				console.log("Tables created for Team and Member models.");
			});
		}else{
      console.log('Skipping automigrate.');
    }
};


