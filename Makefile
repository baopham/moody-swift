deploy-client:
	cd ./Resources/SPA && yarn run deploy:prod

run-client:
	cd ./Resources/SPA && yarn start

run-vapor:
	vapor build && vapor run

run:
	make deploy-client
	vapor build && vapor run
