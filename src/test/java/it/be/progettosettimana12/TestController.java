package it.be.progettosettimana12;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithAnonymousUser;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;

@SpringBootTest
@AutoConfigureMockMvc
public class TestController {

	@Autowired
	private MockMvc mockMvc;

	@Test
	@WithMockUser
	public void loginNoBody() throws Exception {
		this.mockMvc.perform(post("/auth/login")).andExpect(status().isBadRequest());
	}

	@Test
	@WithAnonymousUser
	public void listaAutoriWhenUtenteIsAnonymous() throws Exception {
		this.mockMvc.perform(get("/api/findallAutori")).andDo(print()).andExpect(status().isUnauthorized());
	}

	@Test
	@WithAnonymousUser
	public void listaCategorieWhenUtenteIsAnonymous() throws Exception {
		this.mockMvc.perform(get("/api/findallCategorie")).andDo(print()).andExpect(status().isUnauthorized());
	}

	@Test
	@WithAnonymousUser
	public void listaLibriWhenUtenteIsAnonymous() throws Exception {
		this.mockMvc.perform(get("/api/findallLibri")).andDo(print()).andExpect(status().isUnauthorized());
	}

	@Test
	@WithMockUser(username = "user", password = "user", roles = "USER")
	public void deleteAutoreWhenUserIsAuthenticated() throws Exception {
		this.mockMvc.perform(delete("/api/deleteAutore/2")).andDo(print()).andExpect(status().isForbidden());
	}

	@Test
	@WithMockUser(username = "user", password = "user", roles = "USER")
	public void deleteCategoriaWhenUserIsAuthenticated() throws Exception {
		this.mockMvc.perform(delete("/api/deleteCategoria/4")).andDo(print()).andExpect(status().isForbidden());
	}

	@Test
	@WithMockUser(username = "user", password = "user", roles = "USER")
	public void deleteLibroWhenUserIsAuthenticated() throws Exception {
		this.mockMvc.perform(delete("/api/deleteLibro/1")).andDo(print()).andExpect(status().isForbidden());
	}

	@Test
	@WithMockUser(username = "admin", password = "admin", roles = "ADMIN")
	public void getAutoreWhenAdminIsAuthenticated() throws Exception {
		this.mockMvc.perform(get("/api/getAutore/1")).andDo(print()).andExpect(status().isOk());
	}

	@Test
	@WithMockUser(username = "admin", password = "admin", roles = "ADMIN")
	public void getCategoriaWhenAdminIsAuthenticated() throws Exception {
		this.mockMvc.perform(get("/api/getCategoria/3")).andDo(print()).andExpect(status().isOk());
	}

	@Test
	@WithMockUser(username = "admin", password = "admin", roles = "ADMIN")
	public void getLibroWhenAdminIsAuthenticated() throws Exception {
		this.mockMvc.perform(get("/api/getLibro/2")).andDo(print()).andExpect(status().isOk());
	}

}